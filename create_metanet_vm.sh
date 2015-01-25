# Create metanet Virtual Box
# Provide 3 arguments or none: 
# $1 = path to the vm
# $2 = vm name
# $3 = image to build from 
#  
# Steve Doubleday (ICSI)
#
if [[ -z "$3" ]]; then
  VMPATH="/Users/stevedoubleday/VirtualBox VMs"
  VMNAME="metanet-final"
  ISOFILE="/Users/stevedoubleday/Downloads/CentOS-6.5-x86_64-bin-DVD1.iso"
else 
  VMPATH="$1"
  VMNAME="$2"
  ISOFILE="$3"
fi
echo "createvm"
VBoxManage createvm --name ${VMNAME} --register || echo "createvm failed: rc=$?"
VBoxManage modifyvm ${VMNAME} --memory 5120 --ostype "Linux_64" --cpus 1 --boot1 disk --boot2 dvd --nic1 nat --nictype1 82540EM --nicspeed1 0 --natpf1 "host2guest-ssh,tcp,,2222,,22" --macaddress1 08002715CD83 || echo "modifvm failed: rc=$?"
echo "storagectl..."
VBoxManage storagectl ${VMNAME} --name "IDE" --add ide --controller PIIX4 --bootable on || echo "storagectl IDE failed: rc=$?"
VBoxManage storagectl ${VMNAME} --name "SATA" --add sata --controller IntelAhci --bootable on || echo "storagectl SARA failed: rc=$?"
VBoxManage storageattach ${VMNAME} --storagectl "IDE" --port 1 --device 0 --type dvddrive --medium ${ISOFILE} || echo "storageattach dvd failed: rc=$?"
echo "creating hd0"
VBoxManage createhd --filename "${VMPATH}/${VMNAME}/${VMNAME}-0.vdi" --size 16384 || echo "create hd0 failed: rc=$?"
echo "creating hd1"
VBoxManage createhd --filename "${VMPATH}/${VMNAME}/${VMNAME}-1.vdi" --size 52224 || echo "create hd1 failed: rc=$?"
echo "attaching storage..."
VBoxManage storageattach ${VMNAME} --storagectl "SATA" --port 0 --device 0 --type hdd --medium "${VMPATH}/${VMNAME}/${VMNAME}-0.vdi" || echo "attach hd0 failed: rc=$?"
VBoxManage storageattach ${VMNAME} --storagectl "SATA" --port 1 --device 0 --type hdd --medium "${VMPATH}/${VMNAME}/${VMNAME}-1.vdi" || echo "attach hd1 failed: rc=$?"
echo "booting..."
VBoxManage startvm ${VMNAME}
#
# kickstart poweroff or halt are not equivalent to /sbin/shutdown, 
# as interpreted by VBox (from VBox log).
# VBox interprets kickstart poweroff or halt as RESET (not POWERING_OFF). 
# The VM returns to RUNNING quickly, so the following logic does not reliably 
# work.  Workaround is to boot first from disk, second from dvd.  On the 
# very first boot, the disk has no boot record, so we boot from dvd.  Once 
# kickstart is complete, the disk book will succeed for every later attempt.
# 
# wait until shutdown, then reboot from hard disk
#sleep 180
#echo "checking"
#while :
#do
#  VMSTATUS=`VBoxManage list runningvms | grep ${VMNAME} | wc -l`
#  echo "vmstatus $VMSTATUS"
#  if [[ "$VMSTATUS" -gt 0 ]]; then
#    echo "metanet still running, so waiting"
#    sleep 60
#  else
#    echo "about to start vm"
#    VBoxManage storageattach ${VMNAME} --storagectl "IDE" --port 1 --device 0 --type dvddrive --medium emptydrive
#    VBoxManage modifyvm ${VMNAME} --boot1 disk
#    VBoxManage startvm ${VMNAME}
#    exit 0
#  fi
#done
