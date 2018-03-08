Quick 'n dirty node script for building Vagrant files.

`node viagrant.js` for listing targets.

`node viagrant.js <target>` creates a Vagrantfile and provision.sh in `bin` that can be copied to an empty directory and started with `vagrant up`.

`node viagrant.js -o "<outputdir>" <target>` as above, but places the files in the specified directory (creating it if doesn't exist).

`node viagrant.js -p 4567:80 -o "<outputdir>" <target>` as above, but specifies that port 4567 should be forwarded to port 80 on the vagrant machine.

`node viagrant.js <target> <target...>` adds more targets to the provision file.

## Mautic installation example

Viagrant makes it easy to have a virtual machine with Mautic up and running in Windows. This target have everything ready for a dev environment.

**Pre-install in windows**
- Node.js
- Vagrant
- Virtualbox
- Git
- Any prompt

**Install VM with Mautic**
1. Clone this repo
2. Open the prompt in the newly created directory
3. Run this command to create a mautic target "node viagrant.js -p 4567:80 -o c:/mautic-vm mautic"
4. Go to the "c:/mautic-vm" directory and run "vagrant up"
5. Wait for the installation to finish 
6. Open a browser and go to http://localhost:4567 
7. Do the mautic setup with 'mautic' as mysql settings
8. Enjoy a quick setup to get the latest mautic running

**Limitations**
- This installation have not be tested to send e-mail
- SSL is not test and does not work out of the box
- Timezone is not set in PHP
- You will probably find more stuff

Thanks to the creator of Viagrant [Ciscoheat](https://github.com/ciscoheat) for a nice app!