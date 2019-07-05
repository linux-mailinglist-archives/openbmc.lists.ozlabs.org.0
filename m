Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D0577608DB
	for <lists+openbmc@lfdr.de>; Fri,  5 Jul 2019 17:13:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45gJJS3t9FzDqfr
	for <lists+openbmc@lfdr.de>; Sat,  6 Jul 2019 01:13:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::530; helo=mail-pg1-x530.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="lm/r7bWn"; 
 dkim-atps=neutral
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45gJHQ09SVzDqNL
 for <openbmc@lists.ozlabs.org>; Sat,  6 Jul 2019 01:12:32 +1000 (AEST)
Received: by mail-pg1-x530.google.com with SMTP id z75so4447286pgz.5
 for <openbmc@lists.ozlabs.org>; Fri, 05 Jul 2019 08:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ixz1d9drkjx518C2xtWnhcEDYGFqkBFY49FjPPXfjLk=;
 b=lm/r7bWnNDVC3bDUzqCer9aCeg//h6Pl6V/rnrqCjC2EbjFuHodzRvHKa9xg22jSFr
 Clo9gjQBSj7907muesnC62ceYYYrBUDObWH8NEciwXEBWXKKFL2I89AKtc4FFZWliO+u
 RLuXksKE8Em8fnDCrccDa0U7UsZhc+rIPuw8wtIPQQ8w75OCJKC11rH6YJLDdbhlVOdW
 7BLbCzOdijC8Y+sKJVcYOFa3uzu0ByIqBxZzG1z0e0TwZpL4ROhhVBoqGHVurf9x8WXc
 69qkY54giyDbID+Q+uBiJ40r7hQTc+MRnDASlP/Ux4JmuoNS/Yucq8WsZepYXJee29bc
 q5Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ixz1d9drkjx518C2xtWnhcEDYGFqkBFY49FjPPXfjLk=;
 b=ZTL2NiU1yKnU/+/cHm9IDyOvZi1RGlV2bdHRkWr3HCStZPQsyip3YgDBR6C7fpSajd
 xBGzxfu8La7MePKwnqLoAwpUxYgpadTNiHb6CXkTzURwIcCdIOp3veZxyoxAvudYkGbV
 ROQ2YF7dT6c9/h2ZpvXYzh0siH9x/oUqQMrVwVbCGFuAN/zXE740rKuvTYpXRZ9pQNA8
 ezJNXIhoL2e/inkG7GvSuI9ziIscX8yt7qUQrnIYNCg1SPasIY55cwnVxPGuarXSUIE1
 RXDwSkxO9Jmmw+5svPol9l0TECAdZHFhMz+mjXbcaupwOm38NQ/R4S8yI6ti8XXFK0O3
 3wkg==
X-Gm-Message-State: APjAAAU/nrYRvT/EHK7m7KNfM0ClpdEfBwZYhSYKpkpEAGcowHL0gCOp
 G/pbZmnaDl4XHTsDbtzZAzTlW4U64QquK5lfGdG50g==
X-Google-Smtp-Source: APXvYqwhF19psROfhPc9pUkhKKrQ36DYqALMmKVGtTspV5CtpNrvmRCXy+LXL0MHK25dVKFeauUpBsZuagiz+a7hM40=
X-Received: by 2002:a17:90a:2228:: with SMTP id
 c37mr6300352pje.9.1562339548112; 
 Fri, 05 Jul 2019 08:12:28 -0700 (PDT)
MIME-Version: 1.0
References: <26428e13a88d4ea7bcee9c792b892c7c@lenovo.com>
 <CAO=notyr4whyR8TN5awOVTTrQDMU8kXQYiqBAOUR_fU3dZo0cg@mail.gmail.com>
 <CAO=notwh-2iLhAMHbXd8RzvbBgZWAMLkAwGSLwoPyhL=+SAp8g@mail.gmail.com>
 <027a78e697414daaa44d775062fdb93e@lenovo.com>
 <CAO=notzPUQi1qDCUjVFAHKEauXot26jSSuJthXV8O5ya9woLUg@mail.gmail.com>
 <CAO=notyf1=t+nrw7sh4TR+cwOCDs=LtXnz3oQZEpj6bFG0RQyQ@mail.gmail.com>
 <4db1f213a797472b99fe664d59e296f3@lenovo.com>
 <CAO=notxqvpxFT91VvrnP_K5DpNFmW+31SBFwAVV4OO+wyjpNEQ@mail.gmail.com>
 <CAO=notximZcCAJgoDduSYr1XPUTvymjcpE3ujSV15e0WccPVxw@mail.gmail.com>
 <CAO=notx8td1a2f1=B9RTLiPDTUPvFuhUqZhGBahCWFKrXi9v0w@mail.gmail.com>
 <53220789ed064fa09ed23424cc099b77@lenovo.com>
 <CAO=notwJTb8gWnZdRVs1Uebdkudnw+fzVbU6PggxT4aqFnKjeg@mail.gmail.com>
 <ceb90fbcdb2b4788a2fe26be3748fd02@lenovo.com>
In-Reply-To: <ceb90fbcdb2b4788a2fe26be3748fd02@lenovo.com>
From: Patrick Venture <venture@google.com>
Date: Fri, 5 Jul 2019 08:12:16 -0700
Message-ID: <CAO=notzTgrjG9i4_xPPv2NV_4VNjRYiVjf6QkAfrjx_3U5mdeQ@mail.gmail.com>
Subject: Re: [External] Re: Clarify some questions about in-band firmware
 update
To: Andrew MS1 Peng <pengms1@lenovo.com>
Content-Type: multipart/alternative; boundary="000000000000c90ef5058cf08563"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "benjaminfair@google.com" <benjaminfair@google.com>,
 Duke KH Du <dukh@lenovo.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000c90ef5058cf08563
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 5, 2019 at 2:20 AM Andrew MS1 Peng <pengms1@lenovo.com> wrote:

> Hi Patrick,
>
> Following your instructions to build SDK environment, the host tool has
> been compiled successfully. I really appreciate your help.
>

No problem!  Feel free to email the mailing list with any questions you
have.


> Regards,
> Andrew
>
>
>
> *=E5=8F=91=E4=BB=B6=E4=BA=BA:* Patrick Venture <venture@google.com>
> *=E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4:* 2019=E5=B9=B47=E6=9C=884=E6=97=A5=
 21:59
> *=E6=94=B6=E4=BB=B6=E4=BA=BA:* Andrew MS1 Peng <pengms1@lenovo.com>
> *=E6=8A=84=E9=80=81:* Duke KH Du <dukh@lenovo.com>; benjaminfair@google.c=
om; OpenBMC
> Maillist <openbmc@lists.ozlabs.org>
> *=E4=B8=BB=E9=A2=98:* Re: [External] Re: Clarify some questions about in-=
band firmware
> update
>
>
>
>
>
>
>
> On Thu, Jul 4, 2019 at 5:19 AM Andrew MS1 Peng <pengms1@lenovo.com> wrote=
:
>
> Hi Patrick,
>
> I refer to
> https://github.com/openbmc/docs/blob/master/development/dev-environment.m=
d#download-and-install-sdk
>  to set up my OpenBmc SDK environment, but it seems to be different from
> yours since your SDK environment has packagegroup-core-standalone-sdk-tar=
get.bbappend
> file. I would like to build your SDK environment to test, could you give
> me some clue or guideline to set up the environment?
>
>
>
> The file to which you're referring is not special to my environment and
> it's part of openbmc.  I added ipmi-blob-tool to it so that I wouldn't ha=
ve
> to build it ahead of building burn_my_bmc.  I provided the patch in my
> email so you could make the same change.
>
>
>
> I didn't follow those instructions because I don't know when the last
> build was of the SDK that's published there.  But you can build it yourse=
lf
> trivially:
>
>
>
> $ git clone https://github.com/openbmc/openbmc.git
>
> $ pushd openbmc
>
> ### apply the patch or change I mentioned
>
> $ TEMPLATECONF=3Dmeta-phosphor/conf source oe-init-build-env
> $ umask a+rx,u+rwx
> $ MACHINE=3Dqemux86-64 bitbake obmc-phosphor-image -c populate_sdk
>
> ### wait while it builds everything
>
> $ SDK_DIR=3D/opt/openbmc-phosphor/2.7.0
> $ sudo ./tmp/deploy/sdk/oecore-x86_64-core2-64-toolchain-nodistro.0.sh -d
> $SDK_DIR
>
> ### let it install the SDK
>
> $ source $SDK_DIR/environment-setup-core2-64-openbmc-linux
>
> $ git clone https://github.com/openbmc/phosphor-ipmi-flash
>
> $ pushd phosphor-ipmi-flash
>
> $ export OECORE_TARGET_SYSROOT=3D$SDK_DIR/sysroots/core2-64-openbmc-linux
> $ autoreconf -if
>
> $ ./configure --enable-oe-sdk --host "$(uname -m)"
> --disable-build-bmc-blob-handler AR=3Dx86_64-openbmc-linux-gcc-ar
> RANLIB=3Dx86_64-openbmc-linux-gcc-ranlib
>
> ### and it's built
>
> $ popd
>
> $ popd
>
>
>
> Like I said though, you don't need to use the SDK at all to build it.  Yo=
u
> can just build it on your development workstation following the
> instructions in the README and it'll take a lot less time.
>
>
>
>
>
>
>
> l  *My SDK environment setup procedure*
>
> ## Fetch the OpenBmc x86-64 toolchain
>
> 1. wget
> https://openpower.xyz/job/openbmc-build-sdk/distro=3Dubuntu,target=3Dqemu=
x86-64/lastSuccessfulBuild/artifact/deploy/sdk/oecore-x86_64-core2-64-toolc=
hain-nodistro.0.sh
>
>
>
> ## install toolchain
>
> 2. run ./oecore-x86_64-core2-64-toolchain-nodistro.0.sh
>
>
>
> ## run source env
>
> 3. source ~/SDK/oecore-x86_64/environment-setup-core2-64-openbmc-linux
>
>
>
> ## Fetch source code then compile ipmi-blob-tool and phosphor-ipmi-flash
>
> 4.1 git clone https://github.com/openbmc/ipmi-blob-tool
>
>    4.1.1 cd  ipmi-blob-tool
>
>    4.1.2 ./bootstrap.sh
>
>    4.1.3 ./configure --prefix=3D/home/pengms1/SDK/OpenBmc/rootfs
> --build=3Dx86_64-linux --host=3Dx86_64-openbmc-linux
> -with-libtool-sysroot=3D/home/pengms1/SDK/oecore-x86_64/sysroots/core2-64=
-openbmc-linux/
> -enable-shared --enable-static
>
>    4.1.4 make && make install
>
> 4.2 git clone https://github.com/openbmc/phosphor-ipmi-flash
>
>     4.2.1 cd  phosphor-ipmi-flash
>
>     4.2.2 ./bootstrap.sh
>
>     4.2.3 export
>  PKG_CONFIG_PATH=3D"/home/pengms1/SDK/oecore-x86_64/sysroots/core2-64-ope=
nbmc-linux/usr/lib/pkgconfig:/home/pengms1/SDK/oecore-x86_64/sysroots/core2=
-64-openbmc-linux/usr/share/pkgconfig:/home/pengms1/SDK/OpenBmc/rootfs/lib/=
pkgconfig"
>
>     4.2.4 ./configure --prefix=3D/home/pengms1/SDK/OpenBmc/rootfs
> --build=3Dx86_64-linux --host=3Dx86_64-openbmc-linux
> -with-libtool-sysroot=3D/home/pengms1/SDK/oecore-x86_64/sysroots/core2-64=
-openbmc-linux/
> --disable-build-bmc-blob-handler
>
>     4.2.5  make CPPFLAGS=3D"-I /home/pengms1/SDK/OpenBmc/rootfs/include/"
> LDFLAGS=3D"-L/home/pengms1/SDK/OpenBmc/rootfs/lib -lipmiblob"
>
> l  *Compile status*
>
> *Source code hash id*
>
> *Compile Status*
>
> *Attached file *
>
> c37fe1e938238a10520ff6d120ccf5194ff60fa2
>
> Compile successful
>
> successful.log
>
> 33311b47b3b656cfc16568b4b971730cb79130bc
>
> Compile failed
>
> failed.log
>
>
>
> Regards,
> Andrew
>
> *=E5=8F=91=E4=BB=B6=E4=BA=BA:* Patrick Venture <venture@google.com>
> *=E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4:* 2019=E5=B9=B47=E6=9C=884=E6=97=A5=
 1:04
> *=E6=94=B6=E4=BB=B6=E4=BA=BA:* Andrew MS1 Peng <pengms1@lenovo.com>
> *=E6=8A=84=E9=80=81:* Duke KH Du <dukh@lenovo.com>; benjaminfair@google.c=
om; OpenBMC
> Maillist <openbmc@lists.ozlabs.org>
> *=E4=B8=BB=E9=A2=98:* Re: [External] Re: Clarify some questions about in-=
band firmware
> update
>
>
>
>
>
>
>
> On Wed, Jul 3, 2019 at 7:47 AM Patrick Venture <venture@google.com> wrote=
:
>
>
>
>
>
> On Wed, Jul 3, 2019 at 7:13 AM Patrick Venture <venture@google.com> wrote=
:
>
>
>
>
>
> On Wed, Jul 3, 2019 at 4:51 AM Andrew MS1 Peng <pengms1@lenovo.com> wrote=
:
>
> Hi Patrick,
>
>
>
> Could you help to take a look compile issue as below? I can compile host
> tool with hash id c37fe1e938238a10520ff6d120ccf5194ff60fa2 successfully,
> but fail to compile with hash id c37fe1e938238a10520ff6d120ccf5194ff60fa2
> or later.  Thanks.
>
> /home/pengms1/SDK/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/libexec/x=
86_64-openbmc-linux/gcc/x86_64-openbmc-linux/9.1.0/real-ld:
> burn_my_bmc-main.o: in function
> `host_tool::DevMemDevice::DevMemDevice(internal::Sys const*)':
>
> /home/pengms1/SDK/OpenBmc/phosphor-ipmi-flash/tools/io.hpp:46: undefined
> reference to `internal::sys_impl'
>
> /home/pengms1/SDK/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/libexec/x=
86_64-openbmc-linux/gcc/x86_64-openbmc-linux/9.1.0/real-ld:
> burn_my_bmc-main.o: in function
> `host_tool::BtDataHandler::BtDataHandler(ipmiblob::BlobInterface*,
> internal::Sys const*)':
>
> /home/pengms1/SDK/OpenBmc/phosphor-ipmi-flash/tools/bt.hpp:17: undefined
> reference to `internal::sys_impl'
>
> /home/pengms1/SDK/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/libexec/x=
86_64-openbmc-linux/gcc/x86_64-openbmc-linux/9.1.0/real-ld:
> burn_my_bmc-main.o: in function
> `host_tool::LpcDataHandler::LpcDataHandler(ipmiblob::BlobInterface*,
> host_tool::HostIoInterface*, unsigned int, unsigned int, internal::Sys
> const*)':
>
> /home/pengms1/SDK/OpenBmc/phosphor-ipmi-flash/tools/lpc.hpp:28: undefined
> reference to `internal::sys_impl'
>
> /home/pengms1/SDK/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/libexec/x=
86_64-openbmc-linux/gcc/x86_64-openbmc-linux/9.1.0/real-ld:
> burn_my_bmc-main.o: in function
> `host_tool::P2aDataHandler::P2aDataHandler(ipmiblob::BlobInterface*,
> host_tool::HostIoInterface*, host_tool::PciUtilInterface*, internal::Sys
> const*)':
>
> /home/pengms1/SDK/OpenBmc/phosphor-ipmi-flash/tools/p2a.hpp:28: undefined
> reference to `internal::sys_impl'
>
> /home/pengms1/SDK/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/libexec/x=
86_64-openbmc-linux/gcc/x86_64-openbmc-linux/9.1.0/real-ld:
> ./.libs/libupdater.a(libupdater_la-updater.o): in function
> `host_tool::updaterMain(host_tool::UpdateHandlerInterface*,
> std::__cxx11::basic_string<char, std::char_traits<char>,
> std::allocator<char> > const&, std::__cxx11::basic_string<char,
> std::char_traits<char>, std::allocator<char> > const&,
> std::__cxx11::basic_string<char, std::char_traits<char>,
> std::allocator<char> > const&)':
>
> /home/pengms1/SDK/OpenBmc/phosphor-ipmi-flash/tools/updater.cpp:42:
> undefined reference to `ipmi_flash::staticLayoutBlobId[abi:cxx11]'
>
> /home/pengms1/SDK/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/libexec/x=
86_64-openbmc-linux/gcc/x86_64-openbmc-linux/9.1.0/real-ld:
> /home/pengms1/SDK/OpenBmc/phosphor-ipmi-flash/tools/updater.cpp:42:
> undefined reference to `ipmi_flash::ubiTarballBlobId[abi:cxx11]'
>
> /home/pengms1/SDK/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/libexec/x=
86_64-openbmc-linux/gcc/x86_64-openbmc-linux/9.1.0/real-ld:
> /home/pengms1/SDK/OpenBmc/phosphor-ipmi-flash/tools/updater.cpp:59:
> undefined reference to `ipmi_flash::hashBlobId[abi:cxx11]'
>
> /home/pengms1/SDK/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/libexec/x=
86_64-openbmc-linux/gcc/x86_64-openbmc-linux/9.1.0/real-ld:
> /home/pengms1/SDK/OpenBmc/phosphor-ipmi-flash/tools/updater.cpp:64:
> undefined reference to `ipmi_flash::verifyBlobId[abi:cxx11]'
>
> /home/pengms1/SDK/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/libexec/x=
86_64-openbmc-linux/gcc/x86_64-openbmc-linux/9.1.0/real-ld:
> /home/pengms1/SDK/OpenBmc/phosphor-ipmi-flash/tools/updater.cpp:76:
> undefined reference to `ipmi_flash::updateBlobId[abi:cxx11]'
>
> /home/pengms1/SDK/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/libexec/x=
86_64-openbmc-linux/gcc/x86_64-openbmc-linux/9.1.0/real-ld:
> ./.libs/libupdater.a(libupdater_la-handler.o): in function
> `host_tool::UpdateHandler::cleanArtifacts()':
>
> /home/pengms1/SDK/OpenBmc/phosphor-ipmi-flash/tools/handler.cpp:167:
> undefined reference to `ipmi_flash::cleanupBlobId[abi:cxx11]'
>
> collect2: error: ld returned 1 exit status
>
> Makefile:500: recipe for target 'burn_my_bmc' failed
>
> make[3]: *** [burn_my_bmc] Error 1
>
> make[3]: Leaving directory
> '/home/pengms1/SDK/OpenBmc/phosphor-ipmi-flash/tools'
>
> Makefile:632: recipe for target 'all-recursive' failed
>
> make[2]: *** [all-recursive] Error 1
>
> make[2]: Leaving directory
> '/home/pengms1/SDK/OpenBmc/phosphor-ipmi-flash/tools'
>
> Makefile:611: recipe for target 'all-recursive' failed
>
> make[1]: *** [all-recursive] Error 1
>
> make[1]: Leaving directory '/home/pengms1/SDK/OpenBmc/phosphor-ipmi-flash=
'
>
> Makefile:463: recipe for target 'all' failed
>
> make: *** [all] Error 2
>
>
>
> Since that builds for me, I need to see how you're building it, not just
> the failure output.  How are you configuring it to build?  What changes
> have you made to the recipe?
>
>
>
> I assume you meant you can build at that revision but not after.  The
> patchset after actually fixes it so it'll build properly given the
> instructions specified in the README.  There's a common base library used
> to store the common strings, etc, which are what you're seeing missing in
> the output.  Basically, I'd need to see more output, the commands that ar=
e
> running before the errors.
>
>
>
> I'm building the SDK presently to see if I can reproduce in that
> environment.  If you don't need to build in that environment, you can bui=
ld
> this without it.  The steps on the README were written while building it =
in
> a ubuntu docker instance that had nothing installed (then installed git,
> gcc, etc).
>
>
>
> Firstly, I ran into the issue where ipmi-blob-tool isn't installed into
> the sdk by default:
>
>
>
> ---
> a/meta-phosphor/recipes-core/packagegroups/packagegroup-core-standalone-s=
dk-target.bbappend
> +++
> b/meta-phosphor/recipes-core/packagegroups/packagegroup-core-standalone-s=
dk-target.bbappend
> @@ -1 +1 @@
> -RRECOMMENDS_${PN}_append =3D " gtest sdbusplus phosphor-logging
> libstdc++-staticdev"
> +RRECOMMENDS_${PN}_append =3D " gtest sdbusplus phosphor-logging
> libstdc++-staticdev ipmi-blob-tool"
>
>
>
> Then.
>
>
>
> I'm seeing this, which is likely the cause of the problem.
>
> x86_64-openbmc-linux-ar:
> .libs/libupdater.lax/libfirmware_common.a/libfirmware_common_la-sys.o:
> plugin needed to handle lto object
> x86_64-openbmc-linux-ar:
> .libs/libupdater.lax/libfirmware_common.a/libfirmware_common_la-util.o:
> plugin needed to handle lto object
> x86_64-openbmc-linux-ranlib:
> .libs/libupdater.a(libfirmware_common_la-sys.o): plugin needed to handle
> lto object
> x86_64-openbmc-linux-ranlib:
> .libs/libupdater.a(libfirmware_common_la-util.o): plugin needed to handle
> lto object
>
>
>
> I don't see this issue when building within other instances, bitbake, or
> docker ubuntu.
>
>
>
>
> https://github.com/openbmc/meta-phosphor/blob/master/classes/flto-automak=
e.bbclass
>
>
>
> This defines what should be used with flto in these cases... (our bitbake
> recipes don't' use this consistently).
>
>
>
> $ ./configure --enable-oe-sdk --host "$(uname -m)"
> --disable-build-bmc-blob-handler
>
> ...
>
> checking for x86_64-ar... (cached) x86_64-openbmc-linux-ar
> checking for archiver @FILE support... @
> checking for x86_64-strip... (cached) x86_64-openbmc-linux-strip
> checking for x86_64-ranlib... x86_64-openbmc-linux-ranlib
>
>
>
> So it looks like it isn't checking for the gcc-ar and gcc-ranlib by
> default (no surprise).
>
>
>
> I ran this:
>
>
>
> $ make clean; make distclean;
>
> $ ./configure --enable-oe-sdk --host "$(uname -m)"
> --disable-build-bmc-blob-handler AR=3Dx86_64-openbmc-linux-gcc-ar
> RANLIB=3Dx86_64-openbmc-linux-gcc-ranlib
>
>
>
> ...
>
> checking for x86_64-ar... (cached) x86_64-openbmc-linux-gcc-ar
> checking for archiver @FILE support... @
> checking for x86_64-strip... (cached) x86_64-openbmc-linux-strip
> checking for x86_64-ranlib... x86_64-openbmc-linux-gcc-ranlib
>
> ...
>
>
>
> $ make
>
> ...
>
> make[3]: Entering directory
> '/usr/local/google/git/workspaces/phosphor-ipmi-flash/tools'
>   CXX      burn_my_bmc-main.o
>   CXX      libupdater_la-updater.lo
>   CXX      libupdater_la-handler.lo
>   CXX      libupdater_la-helper.lo
>   CXX      libupdater_la-bt.lo
>   CXX      libupdater_la-lpc.lo
>   CXX      libupdater_la-io.lo
>   CXX      libupdater_la-pci.lo
>   CXX      libupdater_la-p2a.lo
>   CXX      libupdater_la-progress.lo
>   CXXLD    libupdater.la
> /opt/openbmc-phosphor/2.7.0/sysroots/x86_64-oesdk-linux/usr/bin/x86_64-op=
enbmc-linux/../../libexec/x86_64-openbmc-linux/gcc/x86_64-openbmc-linux/9.1=
.0/ar:
> `u' modifier ignored since `D' is the default (see `U')
>   CXXLD    burn_my_bmc
> make[3]: Leaving directory
> '/usr/local/google/git/workspaces/phosphor-ipmi-flash/tools'
> Making all in test
> make[3]: Entering directory
> '/usr/local/google/git/workspaces/phosphor-ipmi-flash/tools/test'
> make[3]: Nothing to be done for 'all'.
> make[3]: Leaving directory
> '/usr/local/google/git/workspaces/phosphor-ipmi-flash/tools/test'
> make[2]: Leaving directory
> '/usr/local/google/git/workspaces/phosphor-ipmi-flash/tools'
> make[1]: Leaving directory
> '/usr/local/google/git/workspaces/phosphor-ipmi-flash'
>
> ....
>
>
>
> This worked fine.
>
> 1) I should switch to flto-automake in the recipe
>
> 2) I can write up a section on compiling this against the SDK.
>
> 3) I should push for use of flto-automake in other recipes**until there's
> an upstream change to support this automatically (maybe there is***separa=
te
> email thread)):
>
>
>
> grep -rn "\-flto"
> ./build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-*|grep Makefile.am
> ./build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-dbus-interfaces/1.=
0+gitAUTOINC+1f0e2ce6e1-r1/git/Makefile.am:9:libphosphor_dbus_la_CXXFLAGS
> =3D $(SYSTEMD_CFLAGS) $(SDBUSPLUS_CFLAGS) -flto
> ./build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-fan/1.0+gitAUTOINC=
+d9a580aa50-r1/git/presence/Makefile.am:28:
> -flto
> ./build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-fan/1.0+gitAUTOINC=
+d9a580aa50-r1/git/control/Makefile.am:30:
> -flto
> ./build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-fan/1.0+gitAUTOINC=
+d9a580aa50-r1/git/monitor/Makefile.am:31:
> -flto
> ./build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-fan/1.0+gitAUTOINC=
+d9a580aa50-r1/git/cooling-type/Makefile.am:17:
> -flto
> ./build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-inventory-manager/=
1.0+gitAUTOINC+ded627c42f-r1/git/Makefile.am:13:phosphor_inventory_CXXFLAGS
> =3D $(SDBUSPLUS_CFLAGS) -flto
> ./build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+gitA=
UTOINC+2a5d8d1ffe-r1/git/user_channel/Makefile.am:2:
> -flto \
> ./build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+gitA=
UTOINC+2a5d8d1ffe-r1/git/libipmid/Makefile.am:2:
> -flto \
> ./build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+gitA=
UTOINC+2a5d8d1ffe-r1/git/Makefile.am:38:
> -flto \
> ./build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+gitA=
UTOINC+2a5d8d1ffe-r1/git/test/Makefile.am:2:
>    -flto \
> ./build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-ipmi-net/1.0+gitAU=
TOINC+052b7cf374-r1/git/Makefile.am:76:
> -flto \
> ./build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-logging/1.0+gitAUT=
OINC+0a0b5ea558-r1/git/phosphor-rsyslog-config/Makefile.am:23:
> -flto
> ./build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-network/1.0+gitAUT=
OINC+7bcaccfdae-r1/git/Makefile.am:45:ncsi_netlink_CXXFLAGS
> =3D -flto
> ./build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-network/1.0+gitAUT=
OINC+7bcaccfdae-r1/git/Makefile.am:98:
> -flto
> ./build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-software-manager/1=
.0+gitAUTOINC+a013560f96-r1/git/Makefile.am:101:
> -flto
> ./build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-time-manager/1.0+g=
itAUTOINC+66bc0a5a9f-r1/git/Makefile.am:24:
>                    -flto
> ./build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-time-manager/1.0+g=
itAUTOINC+66bc0a5a9f-r1/git/test/Makefile.am:24:
>                $(SDBUSPLUS_CFLAGS) -flto
> ./build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-user-manager/1.0+g=
itAUTOINC+75b5a6fc4c-r1/git/phosphor-ldap-config/Makefile.am:26:
>                              -flto
> ./build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-user-manager/1.0+g=
itAUTOINC+75b5a6fc4c-r1/git/phosphor-ldap-mapper/Makefile.am:21:
>                                -flto
>
>
>
>
>
>
>
>
>
>
>
>
>
> Regards,
> Andrew
>
>
>
> *=E5=8F=91=E4=BB=B6=E4=BA=BA:* Patrick Venture <venture@google.com>
> *=E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4:* 2019=E5=B9=B46=E6=9C=8829=E6=97=
=A5 6:24
> *=E6=94=B6=E4=BB=B6=E4=BA=BA:* Andrew MS1 Peng <pengms1@lenovo.com>
> *=E6=8A=84=E9=80=81:* OpenBMC Maillist <openbmc@lists.ozlabs.org>; Duke K=
H Du <
> dukh@lenovo.com>; benjaminfair@google.com; Adriana Kobylak <
> anoo@us.ibm.com>
> *=E4=B8=BB=E9=A2=98:* Re: [External] Re: Clarify some questions about in-=
band firmware
> update
>
>
>
>
>
>
>
> On Fri, Jun 28, 2019 at 7:09 AM Patrick Venture <venture@google.com>
> wrote:
>
>
>
>
>
> On Fri, Jun 28, 2019 at 4:30 AM Andrew MS1 Peng <pengms1@lenovo.com>
> wrote:
>
> Hi Patrick,
>
>
> I synchronized our Openbmc repository with * upstream* repository then
> compiled and checked the result yesterday, we can generate *dynamically
> linked binary but still failed to generate statically linked binary.  *I
> used *OpenBmc *environment to compile and also created a SDK environment
> by using x86-64 toolchain (oecore-x86_64-core2-64-toolchain-nodistro.0.sh=
)
> to compile, the compile result is the same. *It seems to the linker not
> find the *archive file libpci.a, *could you take a look my problem?
> Thanks.*
>
>
>
> *I will get error message when I run the tool in my host platform as
> below. The dynamically linked binary is not convenience to use since I ha=
ve
> to modify *rpath and interpreter of already compiled ELF.
>
> pengms1@hsbmc: $ ./burn_my_bmc
>
> -bash: ./burn_my_bmc: No such file or directory
>
> pengms1@hsbmc: $ ldd ./burn_my_bmc
> *./burn_my_bmc: /lib/x86_64-linux-gnu/libpci.so.3: version `LIBPCI_3.5'
> not found (required by ./burn_my_bmc)*
>
> *       linux-vdso.so.1 =3D>  (0x00007ffcd2363000)*
>
> *       libipmiblob.so.0 =3D>
> /home/pengms1/SDK/OpenBmc/rootfs/lib/libipmiblob.so.0 (0x00007f25d373a000=
)*
>
> *       libpci.so.3 =3D> /lib/x86_64-linux-gnu/libpci.so.3
> (0x00007f25d3512000)*
>
> *       libstdc++.so.6 =3D> /usr/lib/x86_64-linux-gnu/libstdc++.so.6
> (0x00007f25d3190000)*
>
> *       libgcc_s.so.1 =3D> /lib/x86_64-linux-gnu/libgcc_s.so.1
> (0x00007f25d2f79000)*
>
> *       libc.so.6 =3D> /lib/x86_64-linux-gnu/libc.so.6 (0x00007f25d2baf00=
0)*
>
> *       libm.so.6 =3D> /lib/x86_64-linux-gnu/libm.so.6 (0x00007f25d28a600=
0)*
>
> *       libz.so.1 =3D> /lib/x86_64-linux-gnu/libz.so.1 (0x00007f25d268b00=
0)*
>
> *       libresolv.so.2 =3D> /lib/x86_64-linux-gnu/libresolv.so.2
> (0x00007f25d2470000)*
>
> *       libudev.so.1 =3D> /lib/x86_64-linux-gnu/libudev.so.1
> (0x00007f25d2450000)*
>
> *       /lib/ld-linux-x86-64.so.2 =3D> /lib64/ld-linux-x86-64.so.2
> (0x000055731193b000)*
>
> *       librt.so.1 =3D> /lib/x86_64-linux-gnu/librt.so.1
> (0x00007f25d2247000)*
>
> *       libpthread.so.0 =3D> /lib/x86_64-linux-gnu/libpthread.so.0
> (0x00007f25d202a000)*
>
>
>
> *The compile error message is below:*
>
> x86_64-openbmc-linux-libtool: link: x86_64-openbmc-linux-g++ -m64
> -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse
> --sysroot=3D/home/pengms1/openbmc_trunk_x86/build/tmp/work/core2-64-openb=
mc-linux/phosphor-ipmi-flash/0.1+gitAUTOINC+7c79b252c1-r1/recipe-sysroot
> -std=3Dc++17 -I../../git -O2 -pipe -g -feliminate-unused-debug-types
> -fmacro-prefix-map=3D/home/pengms1/openbmc_trunk_x86/build/tmp/work/core2=
-64-openbmc-linux/phosphor-ipmi-flash/0.1+gitAUTOINC+7c79b252c1-r1=3D/usr/s=
rc/debug/phosphor-ipmi-flash/0.1+gitAUTOINC+7c79b252c1-r1
> -fdebug-prefix-map=3D/home/pengms1/openbmc_trunk_x86/build/tmp/work/core2=
-64-openbmc-linux/phosphor-ipmi-flash/0.1+gitAUTOINC+7c79b252c1-r1=3D/usr/s=
rc/debug/phosphor-ipmi-flash/0.1+gitAUTOINC+7c79b252c1-r1
> -fdebug-prefix-map=3D/home/pengms1/openbmc_trunk_x86/build/tmp/work/core2=
-64-openbmc-linux/phosphor-ipmi-flash/0.1+gitAUTOINC+7c79b252c1-r1/recipe-s=
ysroot=3D
> -fdebug-prefix-map=3D/home/pengms1/openbmc_trunk_x86/build/tmp/work/core2=
-64-openbmc-linux/phosphor-ipmi-flash/0.1+gitAUTOINC+7c79b252c1-r1/recipe-s=
ysroot-native=3D
> -fvisibility-inlines-hidden -Wall -Werror -DENABLE_REBOOT_UPDATE
> -DENABLE_STATIC_LAYOUT -DENABLE_LPC_BRIDGE -DASPEED_LPC -static -o
> burn_my_bmc burn_my_bmc-main.o  ./.libs/libupdater.a -lipmiblob -lpci
>
> |
> /home/pengms1/openbmc_trunk_x86/build/tmp/work/core2-64-openbmc-linux/pho=
sphor-ipmi-flash/0.1+gitAUTOINC+7c79b252c1-r1/recipe-sysroot-native/usr/bin=
/x86_64-openbmc-linux/../../libexec/x86_64-openbmc-linux/gcc/x86_64-openbmc=
-linux/9.1.0/ld:
> *cannot find -lpci*
>
>
>
> That's indicating that it couldn't find the pciutils installed.  Like I
> said yesterday, I hadn't tried to build the host-tool in this environment
> and had to clean up the dependency checks for it.  That said, I went
> through and fixed it all and got it to build as expected from a pure ubun=
tu
> docker container.  Those patches are up for review and not yet in OpenBMC=
.
> That said, I dont' know why the lpci might not be found for that
> compilation other than possibly the pciutils recipe is broken.  I found
> yesterday while getting this to work that the instructions on the pciutil=
s
> README weren't quite right for building the library AND installing that
> library.
>
>
>
> So I wrote up custom instructions in the README for phosphor-ipmi-flash,
> that patch is under review.
>
>
>
> If you want to debut your current environment, you need to see if you can
> find the pkgconfig file and libraries defined:
>
> https://github.com/pciutils/pciutils/blob/master/lib/libpci.pc.in
>
>
>
> Basically search for libpci.pc and then read that file.  Verify the share=
d
> library objects are in the SDK environment.
>
>
>
> If you need the libpci archive object for static compilation, that may no=
t
> be installed by default, you'll want to read the pciutils README.
>
>
>
>
>
> *My OpenBmc build **environment is below.*
>
> OpenBmc Setting
>
> phosphor-ipmi-flash setting (build *static binary*)
>
> Extra setting
>
> *Build Configuration:*
>
> *BB_VERSION           =3D "1.43.0"*
>
> *BUILD_SYS            =3D "x86_64-linux"*
>
> *NATIVELSBSTRING      =3D "ubuntu-16.04"*
>
> *TARGET_SYS           =3D "x86_64-openbmc-linux"*
>
> *MACHINE              =3D "qemux86-64"*
>
> *DISTRO               =3D "openbmc-phosphor"*
>
> *DISTRO_VERSION       =3D "0.1.2"*
>
> *TUNE_FEATURES        =3D "m64 core2"*
>
> *TARGET_FPU           =3D ""*
>
> EXTRA_OECONF +=3D " --enable-build-host-tool --enable-static-layout
> --enable-lpc-bridge
> --enable-aspeed-lpc MAPPED_ADDRESS=3D0x98000000 --enable-reboot-update "
>
> EXTRA_OEMAKE +=3D " LDFLAGS=3D-all-static " (Build a *statically linked
> binary*)
>
> DISABLE_STATIC =3D ""  (Build *statically library for *ipmi-blob-tool)
>
> phosphor-ipmi-flash setting (build *dynamic binary*)
>
> EXTRA_OECONF +=3D " --enable-build-host-tool --enable-static-layout
> --enable-lpc-bridge
> --enable-aspeed-lpc MAPPED_ADDRESS=3D0x98000000 --enable-reboot-update "
>
>
>
> Regards,
> Andrew
>
>
>
> *=E5=8F=91=E4=BB=B6=E4=BA=BA:* Patrick Venture <venture@google.com>
> *=E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4:* 2019=E5=B9=B46=E6=9C=8827=E6=97=
=A5 9:59
> *=E6=94=B6=E4=BB=B6=E4=BA=BA:* Andrew MS1 Peng <pengms1@lenovo.com>; Open=
BMC Maillist <
> openbmc@lists.ozlabs.org>
> *=E6=8A=84=E9=80=81:* Duke KH Du <dukh@lenovo.com>; benjaminfair@google.c=
om; Adriana
> Kobylak <anoo@us.ibm.com>
> *=E4=B8=BB=E9=A2=98:* [External] Re: Clarify some questions about in-band=
 firmware update
>
>
>
>
>
>
>
> On Wed, Jun 26, 2019 at 7:44 AM Patrick Venture <venture@google.com>
> wrote:
>
>
>
>
>
> On Wed, Jun 26, 2019 at 4:28 AM Andrew MS1 Peng <pengms1@lenovo.com>
> wrote:
>
> Hi Patrick,
>
>
>
> I have some questions as below, could you help to clarify. Thanks.
>
> 1.      Do you have any plans to support BIOS update in
> phosphor-ipmi-flash?
>
> If the answer is no, we would like to help to add this feature. Could you
> give us some advice or clues to implement it.
>
>
>
> This could be added to the design (first step).
>
> I could probably roll out this in a day or two, it's not a difficult
> extension with a few caveats. We'd have to define new services, such as
> update_bios.service instead of update_bmc.service.
>
>
>
> I have some cycles, so I don't mind reviewing the changes required and
> rolling something out --
>
>
>
> 2.      The FPGA rom image is embedded in BMC image, we would like to add
> fpga-update.service and fpga-verify.service in phosphor-ipmi-flash, we
> expect that run both services after update BMC image completely. Do you
> have any concerns about it?
>
>
>
> There are a couple things to unpack here.  The FPGA rom is embedded in th=
e
> BMC image.  How is the BMC updated?  I ask because a machine can (and is
> expected to) provide its own update_bmc.service implementation.  This
> service could trigger the fpga-verify and fpga-update services within
> whatever code is called from the update_bmc service you specify.
>
>
>
> 3.      How can I make a static executable host tool (burn_my_bmc)?
> Currently, I can=E2=80=99t to make a *statically linked binary successful=
ly*, but
> I have made it before you added p2a function.
>
> For the host tool you need to specify very little, you should be able to
> build it via:
>
> ./bootstrap.sh
>
> ./configure
>
> ./make
>
>
>
> You will need to checkout and install ipmi-blob-tool first
> (openbmc/ipmi-blob-tool)
>
>
>
>
>
> ^^ --- those steps should go on the README.  Will add them shortly.
>
>
>
> Based on different OS environment as below, I would like to have a static
> executable since *dynamically linked binary can=E2=80=99t work normally i=
n host
> OS.*
>
> Host OS environment
>
> Build environment (OpenBmc)
>
> Gcc  v4.8.5
>
> Gcc   v8.3.0
>
> Glibc  v2.17
>
> Glibc  v2.29
>
>
>
> The bitbake recipe isn't meant to be used for the host tool.  It
> explicitly disables building the host-tool by default.  You should be abl=
e
> to check out the repo and build from there.  Let me know if you run into
> issues with that.
>
>
>
> 4.      I didn=E2=80=99t find the below service files in source tree, whe=
re can
> find default services or should we provide our own services?
>
> update_bmc.service
> verify_image.service
> prepare_update.service
>
>
>
> That's correct.  There are currently no default service files.  I am
> thinking of providing a default prepare_update service in a later CL,
> however updating the BMC or verifying the image depend entirely on the
> system -- which makes it difficult to have a default.  In point of fact,
> there isn't really a valid default phosphor-ipmi-flash build for a BMC.
> Everything needs to be specified.
>
>
>
> ^--- I can work on making the ubi bmc option available if the ubi distro
> feature is enabled, etc -- providing some defaults.
>
> ^--- I have a plan to provide a prepare_update.service once I finish
> testing Aspeed LPC support.
>
>
>
>
>
> I've been reviewing the build process for the host-tool and the configure
> file and other pieces require the BMC-stuff to be installed first
> (sdbusplus, etc).  I'm going to cleanup the configure file so that if
> you're building the host-tool it doesn't try to build the BMC stuff.
>
>
>
>
>
> Regards,
> Andrew
>
>
>
> Andrew, the steps here should work for you to build out the host-tool:
> https://github.com/openbmc/phosphor-ipmi-flash#building-and-using-the-hos=
t-tool
>
>
>
> That said, because you requested we support BIOS images too, I'm looking
> at re-working some of the blobIDs involved.  That said, the host-tool and
> BMC version are locked together.
>
>

--000000000000c90ef5058cf08563
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jul 5, 2019 at 2:20 AM Andrew=
 MS1 Peng &lt;<a href=3D"mailto:pengms1@lenovo.com">pengms1@lenovo.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">





<div lang=3D"ZH-CN">
<div class=3D"gmail-m_1545270694092823127WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:black">Hi Patrick,<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:black">Following your instructions to build SDK environment,=
 the host tool has been compiled successfully. I really
 appreciate your help.</span></p></div></div></blockquote><div><br></div><d=
iv>No problem!=C2=A0 Feel free to email the mailing list with any questions=
 you have.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex"><div lang=3D"ZH-CN"><div class=3D"gmail-m_1545270694092823127WordSe=
ction1"><p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Ca=
libri,sans-serif;color:black"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:black">Regards,<br>
Andrew<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:=E7=AD=89=E7=BA=BF;color:rgb(31,73,125)"><u></u>=C2=A0<u></u></span>=
</p>
<p class=3D"MsoNormal"><b><span style=3D"font-size:11pt;font-family:=E7=AD=
=89=E7=BA=BF">=E5=8F=91=E4=BB=B6=E4=BA=BA<span lang=3D"EN-US">:</span></spa=
n></b><span lang=3D"EN-US" style=3D"font-size:11pt;font-family:=E7=AD=89=E7=
=BA=BF"> Patrick Venture &lt;<a href=3D"mailto:venture@google.com" target=
=3D"_blank">venture@google.com</a>&gt;
<br>
</span><b><span style=3D"font-size:11pt;font-family:=E7=AD=89=E7=BA=BF">=E5=
=8F=91=E9=80=81=E6=97=B6=E9=97=B4<span lang=3D"EN-US">:</span></span></b><s=
pan lang=3D"EN-US" style=3D"font-size:11pt;font-family:=E7=AD=89=E7=BA=BF">=
 2019</span><span style=3D"font-size:11pt;font-family:=E7=AD=89=E7=BA=BF">=
=E5=B9=B4<span lang=3D"EN-US">7</span>=E6=9C=88<span lang=3D"EN-US">4</span=
>=E6=97=A5<span lang=3D"EN-US">
 21:59<br>
</span><b>=E6=94=B6=E4=BB=B6=E4=BA=BA<span lang=3D"EN-US">:</span></b><span=
 lang=3D"EN-US"> Andrew MS1 Peng &lt;<a href=3D"mailto:pengms1@lenovo.com" =
target=3D"_blank">pengms1@lenovo.com</a>&gt;<br>
</span><b>=E6=8A=84=E9=80=81<span lang=3D"EN-US">:</span></b><span lang=3D"=
EN-US"> Duke KH Du &lt;<a href=3D"mailto:dukh@lenovo.com" target=3D"_blank"=
>dukh@lenovo.com</a>&gt;; <a href=3D"mailto:benjaminfair@google.com" target=
=3D"_blank">benjaminfair@google.com</a>; OpenBMC Maillist &lt;<a href=3D"ma=
ilto:openbmc@lists.ozlabs.org" target=3D"_blank">openbmc@lists.ozlabs.org</=
a>&gt;<br>
</span><b>=E4=B8=BB=E9=A2=98<span lang=3D"EN-US">:</span></b><span lang=3D"=
EN-US"> Re: [External] Re: Clarify some questions about in-band firmware up=
date<u></u><u></u></span></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">On Thu, Jul 4, 2019 at 5:19 AM =
Andrew MS1 Peng &lt;<a href=3D"mailto:pengms1@lenovo.com" target=3D"_blank"=
>pengms1@lenovo.com</a>&gt; wrote:<u></u><u></u></span></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0cm 0cm 0cm 6pt;margin-left:4=
.8pt;margin-right:0cm">
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:black">Hi Patrick,</span><span lang=3D"EN-US"><u></u><u></u>=
</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:black">I refer to
<a href=3D"https://github.com/openbmc/docs/blob/master/development/dev-envi=
ronment.md#download-and-install-sdk" target=3D"_blank">
<span style=3D"color:black">https://github.com/openbmc/docs/blob/master/dev=
elopment/dev-environment.md#download-and-install-sdk</span></a> =C2=A0to se=
t up my OpenBmc SDK environment, but it seems to be different from yours si=
nce your SDK environment has
</span><span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif">packag=
egroup-core-standalone-sdk-target.bbappend file<span style=3D"color:black">=
. I would like to build your SDK environment to test, could you give me som=
e clue or guideline to set up the environment?</span></span><span lang=3D"E=
N-US"><u></u><u></u></span></p>
</div>
</div>
</blockquote>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">The file to which you&#39;re re=
ferring is not special to my environment and it&#39;s part of openbmc.=C2=
=A0 I added ipmi-blob-tool to it so that I wouldn&#39;t have to build it ah=
ead of building burn_my_bmc.=C2=A0 I provided the patch in my
 email so you could make the same change.<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I didn&#39;t follow those instr=
uctions because I don&#39;t know when the last build was of the SDK that&#3=
9;s published there.=C2=A0 But you can build it yourself trivially:<u></u><=
u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">$ git clone=C2=A0<a href=3D"htt=
ps://github.com/openbmc/openbmc.git" target=3D"_blank">https://github.com/o=
penbmc/openbmc.git</a><u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">$ pushd openbmc<u></u><u></u></=
span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">### apply the patch or change I=
 mentioned<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">$ TEMPLATECONF=3Dmeta-phosphor/=
conf source oe-init-build-env<br>
$ umask a+rx,u+rwx<br>
$ MACHINE=3Dqemux86-64 bitbake obmc-phosphor-image -c populate_sdk<u></u><u=
></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">### wait while it builds everyt=
hing<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">$ SDK_DIR=3D/opt/openbmc-phosph=
or/2.7.0<br>
$ sudo ./tmp/deploy/sdk/<a href=3D"http://oecore-x86_64-core2-64-toolchain-=
nodistro.0.sh" target=3D"_blank">oecore-x86_64-core2-64-toolchain-nodistro.=
0.sh</a> -d $SDK_DIR<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">### let it install the SDK<u></=
u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">$ source $SDK_DIR/environment-s=
etup-core2-64-openbmc-linux<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">$ git clone=C2=A0<a href=3D"htt=
ps://github.com/openbmc/phosphor-ipmi-flash" target=3D"_blank">https://gith=
ub.com/openbmc/phosphor-ipmi-flash</a><u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">$ pushd phosphor-ipmi-flash<u><=
/u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">$ export OECORE_TARGET_SYSROOT=
=3D$SDK_DIR/sysroots/core2-64-openbmc-linux<br>
$ autoreconf -if<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">$ ./configure --enable-oe-sdk -=
-host &quot;$(uname -m)&quot; --disable-build-bmc-blob-handler AR=3Dx86_64-=
openbmc-linux-gcc-ar RANLIB=3Dx86_64-openbmc-linux-gcc-ranlib<u></u><u></u>=
</span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">### and it&#39;s built<u></u><u=
></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">$ popd<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">$ popd<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Like I said though, you don&#39=
;t need to use the SDK at all to build it.=C2=A0 You can just build it on y=
our development workstation following the instructions in the README and it=
&#39;ll take a lot less time.<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0cm 0cm 0cm 6pt;margin-left:4=
.8pt;margin-right:0cm">
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:black">=C2=A0</span><span lang=3D"EN-US"><u></u><u></u></spa=
n></p>
<p class=3D"gmail-m_1545270694092823127gmail-m-8411625341099404742msolistpa=
ragraph" style=3D"margin-left:21pt">
<span lang=3D"EN-US" style=3D"font-family:Wingdings;color:black">l</span><s=
pan lang=3D"EN-US" style=3D"font-size:7pt;font-family:&quot;Times New Roman=
&quot;,serif;color:black">=C2=A0
</span><b><span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;colo=
r:black">My SDK environment setup procedure</span></b><span lang=3D"EN-US">=
<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"text-indent:12pt">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black;ba=
ckground:silver">## Fetch the OpenBmc x86-64 toolchain
</span><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:12pt">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black;ba=
ckground:silver">1. wget
<a href=3D"https://openpower.xyz/job/openbmc-build-sdk/distro=3Dubuntu,targ=
et=3Dqemux86-64/lastSuccessfulBuild/artifact/deploy/sdk/oecore-x86_64-core2=
-64-toolchain-nodistro.0.sh" target=3D"_blank">
https://openpower.xyz/job/openbmc-build-sdk/distro=3Dubuntu,target=3Dqemux8=
6-64/lastSuccessfulBuild/artifact/deploy/sdk/oecore-x86_64-core2-64-toolcha=
in-nodistro.0.sh</a></span><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:12pt">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black;ba=
ckground:silver">=C2=A0</span><span lang=3D"EN-US"><u></u><u></u></span></p=
>
<p class=3D"MsoNormal" style=3D"margin-left:12pt">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black;ba=
ckground:silver">## install toolchain</span><span lang=3D"EN-US"><u></u><u>=
</u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:12pt">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black;ba=
ckground:silver">2. run ./<a href=3D"http://oecore-x86_64-core2-64-toolchai=
n-nodistro.0.sh" target=3D"_blank">oecore-x86_64-core2-64-toolchain-nodistr=
o.0.sh</a>
</span><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:12pt">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black;ba=
ckground:silver">=C2=A0</span><span lang=3D"EN-US"><u></u><u></u></span></p=
>
<p class=3D"MsoNormal" style=3D"margin-left:12pt">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black;ba=
ckground:silver">## run source env</span><span lang=3D"EN-US"><u></u><u></u=
></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:12pt">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black;ba=
ckground:silver">3. source ~/SDK/oecore-x86_64/environment-setup-core2-64-o=
penbmc-linux</span><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:12pt">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black;ba=
ckground:silver">=C2=A0</span><span lang=3D"EN-US"><u></u><u></u></span></p=
>
<p class=3D"MsoNormal" style=3D"margin-left:12pt">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black;ba=
ckground:silver">## Fetch source code then compile ipmi-blob-tool and phosp=
hor-ipmi-flash=C2=A0
</span><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:12pt">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black;ba=
ckground:silver">4.1 git clone
<a href=3D"https://github.com/openbmc/ipmi-blob-tool" target=3D"_blank">htt=
ps://github.com/openbmc/ipmi-blob-tool</a></span><span lang=3D"EN-US"><u></=
u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:12pt">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black;ba=
ckground:silver">=C2=A0=C2=A0 4.1.1 cd=C2=A0 ipmi-blob-tool</span><span lan=
g=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:12pt">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black;ba=
ckground:silver">=C2=A0=C2=A0 4.1.2 ./bootstrap.sh</span><span lang=3D"EN-U=
S"><u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:12pt">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black;ba=
ckground:silver">=C2=A0=C2=A0 4.1.3 ./configure --prefix=3D/home/pengms1/SD=
K/OpenBmc/rootfs --build=3Dx86_64-linux --host=3Dx86_64-openbmc-linux -with=
-libtool-sysroot=3D/home/pengms1/SDK/oecore-x86_64/sysroots/core2-64-openbm=
c-linux/
 -enable-shared --enable-static </span><span lang=3D"EN-US"><u></u><u></u><=
/span></p>
<p class=3D"MsoNormal" style=3D"margin-left:12pt">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black;ba=
ckground:silver">=C2=A0=C2=A0=C2=A04.1.4 make &amp;&amp; make install</span=
><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:12pt">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black;ba=
ckground:silver">4.2 git clone
<a href=3D"https://github.com/openbmc/phosphor-ipmi-flash" target=3D"_blank=
">https://github.com/openbmc/phosphor-ipmi-flash</a></span><span lang=3D"EN=
-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:12pt">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black;ba=
ckground:silver">=C2=A0=C2=A0=C2=A0 4.2.1 cd=C2=A0 phosphor-ipmi-flash</spa=
n><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:12pt">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black;ba=
ckground:silver">=C2=A0=C2=A0=C2=A0 4.2.2 ./bootstrap.sh</span><span lang=
=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:12pt">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black;ba=
ckground:silver">=C2=A0=C2=A0=C2=A0 4.2.3 export=C2=A0 =C2=A0PKG_CONFIG_PAT=
H=3D&quot;/home/pengms1/SDK/oecore-x86_64/sysroots/core2-64-openbmc-linux/u=
sr/lib/pkgconfig:/home/pengms1/SDK/oecore-x86_64/sysroots/core2-64-openbmc-=
linux/usr/share/pkgconfig:/home/pengms1/SDK/OpenBmc/rootfs/lib/pkgconfig&qu=
ot;</span><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:12pt">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black;ba=
ckground:silver">=C2=A0=C2=A0=C2=A0 4.2.4 ./configure --prefix=3D/home/peng=
ms1/SDK/OpenBmc/rootfs --build=3Dx86_64-linux --host=3Dx86_64-openbmc-linux=
=C2=A0 -with-libtool-sysroot=3D/home/pengms1/SDK/oecore-x86_64/sysroots/cor=
e2-64-openbmc-linux/=C2=A0
 --disable-build-bmc-blob-handler</span><span lang=3D"EN-US"><u></u><u></u>=
</span></p>
<p class=3D"MsoNormal" style=3D"margin-left:12pt">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black;ba=
ckground:silver">=C2=A0=C2=A0=C2=A0 4.2.5=C2=A0 make CPPFLAGS=3D&quot;-I /h=
ome/pengms1/SDK/OpenBmc/rootfs/include/&quot; LDFLAGS=3D&quot;-L/home/pengm=
s1/SDK/OpenBmc/rootfs/lib -lipmiblob&quot;</span><span lang=3D"EN-US"><u></=
u><u></u></span></p>
<p class=3D"gmail-m_1545270694092823127gmail-m-8411625341099404742msolistpa=
ragraph" style=3D"margin-left:21pt">
<span lang=3D"EN-US" style=3D"font-family:Wingdings;color:black">l</span><s=
pan lang=3D"EN-US" style=3D"font-size:7pt;font-family:&quot;Times New Roman=
&quot;,serif;color:black">=C2=A0
</span><b><span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;colo=
r:black">Compile status</span></b><span lang=3D"EN-US"><u></u><u></u></span=
></p>
<table class=3D"gmail-m_1545270694092823127MsoNormalTable" border=3D"0" cel=
lspacing=3D"0" cellpadding=3D"0" style=3D"margin-left:21pt;border-collapse:=
collapse">
<tbody>
<tr>
<td width=3D"334" valign=3D"top" style=3D"width:250.55pt;border:1pt solid w=
indowtext;background:yellow;padding:0cm 5.4pt">
<p class=3D"gmail-m_1545270694092823127gmail-m-8411625341099404742msolistpa=
ragraph"><b><span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;co=
lor:black">Source code hash id</span></b><span lang=3D"EN-US"><u></u><u></u=
></span></p>
</td>
<td width=3D"167" valign=3D"top" style=3D"width:124.95pt;border-top:1pt sol=
id windowtext;border-right:1pt solid windowtext;border-bottom:1pt solid win=
dowtext;border-left:none;background:yellow;padding:0cm 5.4pt">
<p class=3D"gmail-m_1545270694092823127gmail-m-8411625341099404742msolistpa=
ragraph"><b><span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;co=
lor:black">Compile Status</span></b><span lang=3D"EN-US"><u></u><u></u></sp=
an></p>
</td>
<td width=3D"167" valign=3D"top" style=3D"width:124.95pt;border-top:1pt sol=
id windowtext;border-right:1pt solid windowtext;border-bottom:1pt solid win=
dowtext;border-left:none;background:yellow;padding:0cm 5.4pt">
<p class=3D"gmail-m_1545270694092823127gmail-m-8411625341099404742msolistpa=
ragraph"><b><span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;co=
lor:black">Attached file
</span></b><span lang=3D"EN-US"><u></u><u></u></span></p>
</td>
</tr>
<tr>
<td width=3D"334" valign=3D"top" style=3D"width:250.55pt;border-right:1pt s=
olid windowtext;border-bottom:1pt solid windowtext;border-left:1pt solid wi=
ndowtext;border-top:none;padding:0cm 5.4pt">
<p class=3D"gmail-m_1545270694092823127gmail-m-8411625341099404742msolistpa=
ragraph"><span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color=
:black">c37fe1e938238a10520ff6d120ccf5194ff60fa2</span><span lang=3D"EN-US"=
><u></u><u></u></span></p>
</td>
<td width=3D"167" valign=3D"top" style=3D"width:124.95pt;border-top:none;bo=
rder-left:none;border-bottom:1pt solid windowtext;border-right:1pt solid wi=
ndowtext;padding:0cm 5.4pt">
<p class=3D"gmail-m_1545270694092823127gmail-m-8411625341099404742msolistpa=
ragraph"><span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color=
:black">Compile successful</span><span lang=3D"EN-US"><u></u><u></u></span>=
</p>
</td>
<td width=3D"167" valign=3D"top" style=3D"width:124.95pt;border-top:none;bo=
rder-left:none;border-bottom:1pt solid windowtext;border-right:1pt solid wi=
ndowtext;padding:0cm 5.4pt">
<p class=3D"gmail-m_1545270694092823127gmail-m-8411625341099404742msolistpa=
ragraph"><span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color=
:black">successful.log</span><span lang=3D"EN-US"><u></u><u></u></span></p>
</td>
</tr>
<tr>
<td width=3D"334" valign=3D"top" style=3D"width:250.55pt;border-right:1pt s=
olid windowtext;border-bottom:1pt solid windowtext;border-left:1pt solid wi=
ndowtext;border-top:none;padding:0cm 5.4pt">
<p class=3D"gmail-m_1545270694092823127gmail-m-8411625341099404742msolistpa=
ragraph"><span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color=
:black">33311b47b3b656cfc16568b4b971730cb79130bc</span><span lang=3D"EN-US"=
><u></u><u></u></span></p>
</td>
<td width=3D"167" valign=3D"top" style=3D"width:124.95pt;border-top:none;bo=
rder-left:none;border-bottom:1pt solid windowtext;border-right:1pt solid wi=
ndowtext;padding:0cm 5.4pt">
<p class=3D"gmail-m_1545270694092823127gmail-m-8411625341099404742msolistpa=
ragraph"><span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color=
:black">Compile failed</span><span lang=3D"EN-US"><u></u><u></u></span></p>
</td>
<td width=3D"167" valign=3D"top" style=3D"width:124.95pt;border-top:none;bo=
rder-left:none;border-bottom:1pt solid windowtext;border-right:1pt solid wi=
ndowtext;padding:0cm 5.4pt">
<p class=3D"gmail-m_1545270694092823127gmail-m-8411625341099404742msolistpa=
ragraph"><span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color=
:black">failed.log</span><span lang=3D"EN-US"><u></u><u></u></span></p>
</td>
</tr>
</tbody>
</table>
<p class=3D"gmail-m_1545270694092823127gmail-m-8411625341099404742msolistpa=
ragraph" style=3D"margin-left:21pt">
<b><span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black=
">=C2=A0</span></b><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:black">Regards,<br>
Andrew</span><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><b><span style=3D"font-size:11pt;font-family:=E7=AD=
=89=E7=BA=BF">=E5=8F=91=E4=BB=B6=E4=BA=BA<span lang=3D"EN-US">:</span></spa=
n></b><span lang=3D"EN-US" style=3D"font-size:11pt;font-family:=E7=AD=89=E7=
=BA=BF"> Patrick Venture &lt;<a href=3D"mailto:venture@google.com" target=
=3D"_blank">venture@google.com</a>&gt;
<br>
</span><b><span style=3D"font-size:11pt;font-family:=E7=AD=89=E7=BA=BF">=E5=
=8F=91=E9=80=81=E6=97=B6=E9=97=B4<span lang=3D"EN-US">:</span></span></b><s=
pan lang=3D"EN-US" style=3D"font-size:11pt;font-family:=E7=AD=89=E7=BA=BF">=
 2019</span><span style=3D"font-size:11pt;font-family:=E7=AD=89=E7=BA=BF">=
=E5=B9=B4<span lang=3D"EN-US">7</span>=E6=9C=88<span lang=3D"EN-US">4</span=
>=E6=97=A5<span lang=3D"EN-US">
 1:04<br>
</span><b>=E6=94=B6=E4=BB=B6=E4=BA=BA<span lang=3D"EN-US">:</span></b><span=
 lang=3D"EN-US"> Andrew MS1 Peng &lt;<a href=3D"mailto:pengms1@lenovo.com" =
target=3D"_blank">pengms1@lenovo.com</a>&gt;<br>
</span><b>=E6=8A=84=E9=80=81<span lang=3D"EN-US">:</span></b><span lang=3D"=
EN-US"> Duke KH Du &lt;<a href=3D"mailto:dukh@lenovo.com" target=3D"_blank"=
>dukh@lenovo.com</a>&gt;;
<a href=3D"mailto:benjaminfair@google.com" target=3D"_blank">benjaminfair@g=
oogle.com</a>; OpenBMC Maillist &lt;<a href=3D"mailto:openbmc@lists.ozlabs.=
org" target=3D"_blank">openbmc@lists.ozlabs.org</a>&gt;<br>
</span><b>=E4=B8=BB=E9=A2=98<span lang=3D"EN-US">:</span></b><span lang=3D"=
EN-US"> Re: [External] Re: Clarify some questions about in-band firmware up=
date</span></span><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">On Wed, Jul 3, 2019 at 7:47 AM =
Patrick Venture &lt;<a href=3D"mailto:venture@google.com" target=3D"_blank"=
>venture@google.com</a>&gt; wrote:<u></u><u></u></span></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0cm 0cm 0cm 6pt;margin:5pt 0c=
m 5pt 4.8pt">
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">On Wed, Jul 3, 2019 at 7:13 AM =
Patrick Venture &lt;<a href=3D"mailto:venture@google.com" target=3D"_blank"=
>venture@google.com</a>&gt; wrote:<u></u><u></u></span></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0cm 0cm 0cm 6pt;margin:5pt 0c=
m 5pt 4.8pt">
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">On Wed, Jul 3, 2019 at 4:51 AM =
Andrew MS1 Peng &lt;<a href=3D"mailto:pengms1@lenovo.com" target=3D"_blank"=
>pengms1@lenovo.com</a>&gt; wrote:<u></u><u></u></span></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0cm 0cm 0cm 6pt;margin:5pt 0c=
m 5pt 4.8pt">
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:rgb(0,112,192)">Hi Patrick,</span><span lang=3D"EN-US"><u></=
u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:rgb(0,112,192)">=C2=A0</span><span lang=3D"EN-US"><u></u><u>=
</u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:rgb(0,112,192)">Could you help to take a look compile issue =
as below? I can compile host tool with hash id
<span style=3D"background:white">c37fe1e938238a10520ff6d120ccf5194ff60fa2 s=
uccessfully, but fail to compile with hash id c37fe1e938238a10520ff6d120ccf=
5194ff60fa2 or later.=C2=A0 Thanks.</span><br>
<br>
</span><span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:b=
lack;background:silver">/home/pengms1/SDK/oecore-x86_64/sysroots/x86_64-oes=
dk-linux/usr/libexec/x86_64-openbmc-linux/gcc/x86_64-openbmc-linux/9.1.0/re=
al-ld: burn_my_bmc-main.o: in function
 `host_tool::DevMemDevice::DevMemDevice(internal::Sys const*)&#39;:</span><=
span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:black;background:silver">/home/pengms1/SDK/OpenBmc/phosphor-=
ipmi-flash/tools/io.hpp:46: undefined reference to `internal::sys_impl&#39;=
</span><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:black;background:silver">/home/pengms1/SDK/oecore-x86_64/sys=
roots/x86_64-oesdk-linux/usr/libexec/x86_64-openbmc-linux/gcc/x86_64-openbm=
c-linux/9.1.0/real-ld:
 burn_my_bmc-main.o: in function `host_tool::BtDataHandler::BtDataHandler(i=
pmiblob::BlobInterface*, internal::Sys const*)&#39;:</span><span lang=3D"EN=
-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:black;background:silver">/home/pengms1/SDK/OpenBmc/phosphor-=
ipmi-flash/tools/bt.hpp:17: undefined reference to `internal::sys_impl&#39;=
</span><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:black;background:silver">/home/pengms1/SDK/oecore-x86_64/sys=
roots/x86_64-oesdk-linux/usr/libexec/x86_64-openbmc-linux/gcc/x86_64-openbm=
c-linux/9.1.0/real-ld:
 burn_my_bmc-main.o: in function `host_tool::LpcDataHandler::LpcDataHandler=
(ipmiblob::BlobInterface*, host_tool::HostIoInterface*, unsigned int, unsig=
ned int, internal::Sys const*)&#39;:</span><span lang=3D"EN-US"><u></u><u><=
/u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:black;background:silver">/home/pengms1/SDK/OpenBmc/phosphor-=
ipmi-flash/tools/lpc.hpp:28: undefined reference to
 `internal::sys_impl&#39;</span><span lang=3D"EN-US"><u></u><u></u></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:black;background:silver">/home/pengms1/SDK/oecore-x86_64/sys=
roots/x86_64-oesdk-linux/usr/libexec/x86_64-openbmc-linux/gcc/x86_64-openbm=
c-linux/9.1.0/real-ld:
 burn_my_bmc-main.o: in function `host_tool::P2aDataHandler::P2aDataHandler=
(ipmiblob::BlobInterface*, host_tool::HostIoInterface*, host_tool::PciUtilI=
nterface*, internal::Sys const*)&#39;:</span><span lang=3D"EN-US"><u></u><u=
></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:black;background:silver">/home/pengms1/SDK/OpenBmc/phosphor-=
ipmi-flash/tools/p2a.hpp:28: undefined reference to
 `internal::sys_impl&#39;</span><span lang=3D"EN-US"><u></u><u></u></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:black;background:silver">/home/pengms1/SDK/oecore-x86_64/sys=
roots/x86_64-oesdk-linux/usr/libexec/x86_64-openbmc-linux/gcc/x86_64-openbm=
c-linux/9.1.0/real-ld:
 ./.libs/libupdater.a(libupdater_la-updater.o): in function `host_tool::upd=
aterMain(host_tool::UpdateHandlerInterface*, std::__cxx11::basic_string&lt;=
char, std::char_traits&lt;char&gt;, std::allocator&lt;char&gt; &gt; const&a=
mp;, std::__cxx11::basic_string&lt;char, std::char_traits&lt;char&gt;,
 std::allocator&lt;char&gt; &gt; const&amp;, std::__cxx11::basic_string&lt;=
char, std::char_traits&lt;char&gt;, std::allocator&lt;char&gt; &gt; const&a=
mp;)&#39;:</span><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:black;background:silver">/home/pengms1/SDK/OpenBmc/phosphor-=
ipmi-flash/tools/updater.cpp:42: undefined reference
 to `ipmi_flash::staticLayoutBlobId[abi:cxx11]&#39;</span><span lang=3D"EN-=
US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:black;background:silver">/home/pengms1/SDK/oecore-x86_64/sys=
roots/x86_64-oesdk-linux/usr/libexec/x86_64-openbmc-linux/gcc/x86_64-openbm=
c-linux/9.1.0/real-ld:
 /home/pengms1/SDK/OpenBmc/phosphor-ipmi-flash/tools/updater.cpp:42: undefi=
ned reference to `ipmi_flash::ubiTarballBlobId[abi:cxx11]&#39;</span><span =
lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:black;background:silver">/home/pengms1/SDK/oecore-x86_64/sys=
roots/x86_64-oesdk-linux/usr/libexec/x86_64-openbmc-linux/gcc/x86_64-openbm=
c-linux/9.1.0/real-ld:
 /home/pengms1/SDK/OpenBmc/phosphor-ipmi-flash/tools/updater.cpp:59: undefi=
ned reference to `ipmi_flash::hashBlobId[abi:cxx11]&#39;</span><span lang=
=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:black;background:silver">/home/pengms1/SDK/oecore-x86_64/sys=
roots/x86_64-oesdk-linux/usr/libexec/x86_64-openbmc-linux/gcc/x86_64-openbm=
c-linux/9.1.0/real-ld:
 /home/pengms1/SDK/OpenBmc/phosphor-ipmi-flash/tools/updater.cpp:64: undefi=
ned reference to `ipmi_flash::verifyBlobId[abi:cxx11]&#39;</span><span lang=
=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:black;background:silver">/home/pengms1/SDK/oecore-x86_64/sys=
roots/x86_64-oesdk-linux/usr/libexec/x86_64-openbmc-linux/gcc/x86_64-openbm=
c-linux/9.1.0/real-ld:
 /home/pengms1/SDK/OpenBmc/phosphor-ipmi-flash/tools/updater.cpp:76: undefi=
ned reference to `ipmi_flash::updateBlobId[abi:cxx11]&#39;</span><span lang=
=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:black;background:silver">/home/pengms1/SDK/oecore-x86_64/sys=
roots/x86_64-oesdk-linux/usr/libexec/x86_64-openbmc-linux/gcc/x86_64-openbm=
c-linux/9.1.0/real-ld:
 ./.libs/libupdater.a(libupdater_la-handler.o): in function `host_tool::Upd=
ateHandler::cleanArtifacts()&#39;:</span><span lang=3D"EN-US"><u></u><u></u=
></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:black;background:silver">/home/pengms1/SDK/OpenBmc/phosphor-=
ipmi-flash/tools/handler.cpp:167: undefined reference
 to `ipmi_flash::cleanupBlobId[abi:cxx11]&#39;</span><span lang=3D"EN-US"><=
u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:black;background:silver">collect2: error: ld returned 1 exit=
 status</span><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:black;background:silver">Makefile:500: recipe for target &#3=
9;burn_my_bmc&#39; failed</span><span lang=3D"EN-US"><u></u><u></u></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:black;background:silver">make[3]: *** [burn_my_bmc] Error 1<=
/span><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:black;background:silver">make[3]: Leaving directory &#39;/ho=
me/pengms1/SDK/OpenBmc/phosphor-ipmi-flash/tools&#39;</span><span lang=3D"E=
N-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:black;background:silver">Makefile:632: recipe for target &#3=
9;all-recursive&#39; failed</span><span lang=3D"EN-US"><u></u><u></u></span=
></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:black;background:silver">make[2]: *** [all-recursive] Error =
1</span><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:black;background:silver">make[2]: Leaving directory &#39;/ho=
me/pengms1/SDK/OpenBmc/phosphor-ipmi-flash/tools&#39;</span><span lang=3D"E=
N-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:black;background:silver">Makefile:611: recipe for target &#3=
9;all-recursive&#39; failed</span><span lang=3D"EN-US"><u></u><u></u></span=
></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:black;background:silver">make[1]: *** [all-recursive] Error =
1</span><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:black;background:silver">make[1]: Leaving directory &#39;/ho=
me/pengms1/SDK/OpenBmc/phosphor-ipmi-flash&#39;</span><span lang=3D"EN-US">=
<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:black;background:silver">Makefile:463: recipe for target &#3=
9;all&#39; failed</span><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:black;background:silver">make: *** [all] Error 2</span><span=
 lang=3D"EN-US"><u></u><u></u></span></p>
</div>
</div>
</blockquote>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Since that builds for me, I nee=
d to see how you&#39;re building it, not just the failure output.=C2=A0 How=
 are you configuring it to build?=C2=A0 What changes have you made
 to the recipe?<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I assume you meant you can buil=
d at that revision but not after.=C2=A0 The patchset after actually fixes i=
t so it&#39;ll build properly given the instructions specified
 in the README.=C2=A0 There&#39;s a common base library used to store the c=
ommon strings, etc, which are what you&#39;re seeing missing in the output.=
=C2=A0 Basically, I&#39;d need to see more output, the commands that are ru=
nning before the errors.<u></u><u></u></span></p>
</div>
</div>
</div>
</blockquote>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I&#39;m building the SDK presen=
tly to see if I can reproduce in that environment.=C2=A0 If you don&#39;t n=
eed to build in that environment, you can build this without it.=C2=A0
 The steps on the README were written while building it in a ubuntu docker =
instance that had nothing installed (then installed git, gcc, etc).<u></u><=
u></u></span></p>
</div>
</div>
</div>
</blockquote>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Firstly, I ran into the issue w=
here ipmi-blob-tool isn&#39;t installed into the sdk by default:<u></u><u><=
/u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">--- a/meta-phosphor/recipes-cor=
e/packagegroups/packagegroup-core-standalone-sdk-target.bbappend<br>
+++ b/meta-phosphor/recipes-core/packagegroups/packagegroup-core-standalone=
-sdk-target.bbappend<br>
@@ -1 +1 @@<br>
-RRECOMMENDS_${PN}_append =3D &quot; gtest sdbusplus phosphor-logging libst=
dc++-staticdev&quot;<br>
+RRECOMMENDS_${PN}_append =3D &quot; gtest sdbusplus phosphor-logging libst=
dc++-staticdev ipmi-blob-tool&quot;<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Then.<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I&#39;m seeing this, which is l=
ikely the cause of the problem.<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">x86_64-openbmc-linux-ar: .libs/=
libupdater.lax/libfirmware_common.a/libfirmware_common_la-sys.o: plugin nee=
ded to handle lto object<br>
x86_64-openbmc-linux-ar: .libs/libupdater.lax/libfirmware_common.a/libfirmw=
are_common_la-util.o: plugin needed to handle lto object<br>
x86_64-openbmc-linux-ranlib: .libs/libupdater.a(libfirmware_common_la-sys.o=
): plugin needed to handle lto object<br>
x86_64-openbmc-linux-ranlib: .libs/libupdater.a(libfirmware_common_la-util.=
o): plugin needed to handle lto object<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I don&#39;t see this issue when=
 building within other instances, bitbake, or docker ubuntu.<u></u><u></u><=
/span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><a href=3D"https://github.com/o=
penbmc/meta-phosphor/blob/master/classes/flto-automake.bbclass" target=3D"_=
blank">https://github.com/openbmc/meta-phosphor/blob/master/classes/flto-au=
tomake.bbclass</a><u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">This defines what should be use=
d with flto in these cases... (our bitbake recipes don&#39;t&#39; use this =
consistently).<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">$ ./configure --enable-oe-sdk -=
-host &quot;$(uname -m)&quot; --disable-build-bmc-blob-handler<u></u><u></u=
></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">...<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">checking for x86_64-ar... (cach=
ed) x86_64-openbmc-linux-ar<br>
checking for archiver @FILE support... @<br>
checking for x86_64-strip... (cached) x86_64-openbmc-linux-strip<br>
checking for x86_64-ranlib... x86_64-openbmc-linux-ranlib<u></u><u></u></sp=
an></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">So it looks like it isn&#39;t c=
hecking for the gcc-ar and gcc-ranlib by default (no surprise).<u></u><u></=
u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I ran this:<u></u><u></u></span=
></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">$ make clean; make distclean;<u=
></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">$ ./configure --enable-oe-sdk -=
-host &quot;$(uname -m)&quot; --disable-build-bmc-blob-handler AR=3Dx86_64-=
openbmc-linux-gcc-ar RANLIB=3Dx86_64-openbmc-linux-gcc-ranlib<u></u><u></u>=
</span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">...<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">checking for x86_64-ar... (cach=
ed) x86_64-openbmc-linux-gcc-ar<br>
checking for archiver @FILE support... @<br>
checking for x86_64-strip... (cached) x86_64-openbmc-linux-strip<br>
checking for x86_64-ranlib... x86_64-openbmc-linux-gcc-ranlib<u></u><u></u>=
</span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">...<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">$ make<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">...<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">make[3]: Entering directory &#3=
9;/usr/local/google/git/workspaces/phosphor-ipmi-flash/tools&#39;<br>
=C2=A0 CXX =C2=A0 =C2=A0 =C2=A0burn_my_bmc-main.o<br>
=C2=A0 CXX =C2=A0 =C2=A0 =C2=A0libupdater_la-updater.lo<br>
=C2=A0 CXX =C2=A0 =C2=A0 =C2=A0libupdater_la-handler.lo<br>
=C2=A0 CXX =C2=A0 =C2=A0 =C2=A0libupdater_la-helper.lo<br>
=C2=A0 CXX =C2=A0 =C2=A0 =C2=A0libupdater_la-bt.lo<br>
=C2=A0 CXX =C2=A0 =C2=A0 =C2=A0libupdater_la-lpc.lo<br>
=C2=A0 CXX =C2=A0 =C2=A0 =C2=A0libupdater_la-io.lo<br>
=C2=A0 CXX =C2=A0 =C2=A0 =C2=A0libupdater_la-pci.lo<br>
=C2=A0 CXX =C2=A0 =C2=A0 =C2=A0libupdater_la-p2a.lo<br>
=C2=A0 CXX =C2=A0 =C2=A0 =C2=A0libupdater_la-progress.lo<br>
=C2=A0 CXXLD =C2=A0 =C2=A0<a href=3D"http://libupdater.la" target=3D"_blank=
">libupdater.la</a><br>
/opt/openbmc-phosphor/2.7.0/sysroots/x86_64-oesdk-linux/usr/bin/x86_64-open=
bmc-linux/../../libexec/x86_64-openbmc-linux/gcc/x86_64-openbmc-linux/9.1.0=
/ar: `u&#39; modifier ignored since `D&#39; is the default (see `U&#39;)<br=
>
=C2=A0 CXXLD =C2=A0 =C2=A0burn_my_bmc<br>
make[3]: Leaving directory &#39;/usr/local/google/git/workspaces/phosphor-i=
pmi-flash/tools&#39;<br>
Making all in test<br>
make[3]: Entering directory &#39;/usr/local/google/git/workspaces/phosphor-=
ipmi-flash/tools/test&#39;<br>
make[3]: Nothing to be done for &#39;all&#39;.<br>
make[3]: Leaving directory &#39;/usr/local/google/git/workspaces/phosphor-i=
pmi-flash/tools/test&#39;<br>
make[2]: Leaving directory &#39;/usr/local/google/git/workspaces/phosphor-i=
pmi-flash/tools&#39;<br>
make[1]: Leaving directory &#39;/usr/local/google/git/workspaces/phosphor-i=
pmi-flash&#39;<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">....<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">This worked fine.<u></u><u></u>=
</span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">1) I should switch to flto-auto=
make in the recipe<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">2) I can write up a section on =
compiling this against the SDK.<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">3) I should push for use of flt=
o-automake in other recipes**until there&#39;s an upstream change to suppor=
t this automatically (maybe there is***separate email thread)):<u></u><u></=
u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">grep -rn &quot;\-flto&quot; ./b=
uild/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-*|grep Makefile.am<br>
./build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-dbus-interfaces/1.0+=
gitAUTOINC+1f0e2ce6e1-r1/git/Makefile.am:9:libphosphor_dbus_la_CXXFLAGS =3D=
 $(SYSTEMD_CFLAGS) $(SDBUSPLUS_CFLAGS) -flto<br>
./build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-fan/1.0+gitAUTOINC+d=
9a580aa50-r1/git/presence/Makefile.am:28: -flto<br>
./build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-fan/1.0+gitAUTOINC+d=
9a580aa50-r1/git/control/Makefile.am:30: -flto<br>
./build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-fan/1.0+gitAUTOINC+d=
9a580aa50-r1/git/monitor/Makefile.am:31: -flto<br>
./build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-fan/1.0+gitAUTOINC+d=
9a580aa50-r1/git/cooling-type/Makefile.am:17: -flto<br>
./build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-inventory-manager/1.=
0+gitAUTOINC+ded627c42f-r1/git/Makefile.am:13:phosphor_inventory_CXXFLAGS =
=3D $(SDBUSPLUS_CFLAGS) -flto<br>
./build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+gitAUT=
OINC+2a5d8d1ffe-r1/git/user_channel/Makefile.am:2: -flto \<br>
./build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+gitAUT=
OINC+2a5d8d1ffe-r1/git/libipmid/Makefile.am:2: -flto \<br>
./build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+gitAUT=
OINC+2a5d8d1ffe-r1/git/Makefile.am:38: -flto \<br>
./build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+gitAUT=
OINC+2a5d8d1ffe-r1/git/test/Makefile.am:2: =C2=A0 =C2=A0-flto \<br>
./build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-ipmi-net/1.0+gitAUTO=
INC+052b7cf374-r1/git/Makefile.am:76: -flto \<br>
./build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-logging/1.0+gitAUTOI=
NC+0a0b5ea558-r1/git/phosphor-rsyslog-config/Makefile.am:23: -flto<br>
./build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-network/1.0+gitAUTOI=
NC+7bcaccfdae-r1/git/Makefile.am:45:ncsi_netlink_CXXFLAGS =3D -flto<br>
./build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-network/1.0+gitAUTOI=
NC+7bcaccfdae-r1/git/Makefile.am:98: -flto<br>
./build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-software-manager/1.0=
+gitAUTOINC+a013560f96-r1/git/Makefile.am:101: -flto<br>
./build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-time-manager/1.0+git=
AUTOINC+66bc0a5a9f-r1/git/Makefile.am:24: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-flto<br>
./build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-time-manager/1.0+git=
AUTOINC+66bc0a5a9f-r1/git/test/Makefile.am:24: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0$(SDBUSPLUS_CFLAGS) -flto<br>
./build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-user-manager/1.0+git=
AUTOINC+75b5a6fc4c-r1/git/phosphor-ldap-config/Makefile.am:26: =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0-flto<br>
./build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-user-manager/1.0+git=
AUTOINC+75b5a6fc4c-r1/git/phosphor-ldap-mapper/Makefile.am:21: =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0-flto<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0cm 0cm 0cm 6pt;margin:5pt 0c=
m 5pt 4.8pt">
<div>
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0cm 0cm 0cm 6pt;margin:5pt 0c=
m 5pt 4.8pt">
<div>
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0cm 0cm 0cm 6pt;margin:5pt 0c=
m 5pt 4.8pt">
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:rgb(31,73,125)">=C2=A0</span><span lang=3D"EN-US"><u></u><u>=
</u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:rgb(31,73,125)">=C2=A0</span><span lang=3D"EN-US"><u></u><u>=
</u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:rgb(0,112,192)">Regards,<br>
Andrew</span><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:=E7=AD=89=E7=BA=BF;color:rgb(31,73,125)">=C2=A0</span><span lang=3D"=
EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><b><span style=3D"font-size:11pt;font-family:=E7=AD=
=89=E7=BA=BF">=E5=8F=91=E4=BB=B6=E4=BA=BA<span lang=3D"EN-US">:</span></spa=
n></b><span lang=3D"EN-US" style=3D"font-size:11pt;font-family:=E7=AD=89=E7=
=BA=BF"> Patrick Venture &lt;<a href=3D"mailto:venture@google.com" target=
=3D"_blank">venture@google.com</a>&gt;
<br>
</span><b><span style=3D"font-size:11pt;font-family:=E7=AD=89=E7=BA=BF">=E5=
=8F=91=E9=80=81=E6=97=B6=E9=97=B4<span lang=3D"EN-US">:</span></span></b><s=
pan lang=3D"EN-US" style=3D"font-size:11pt;font-family:=E7=AD=89=E7=BA=BF">=
 2019</span><span style=3D"font-size:11pt;font-family:=E7=AD=89=E7=BA=BF">=
=E5=B9=B4<span lang=3D"EN-US">6</span>=E6=9C=88<span lang=3D"EN-US">29</spa=
n>=E6=97=A5<span lang=3D"EN-US">
 6:24<br>
</span><b>=E6=94=B6=E4=BB=B6=E4=BA=BA<span lang=3D"EN-US">:</span></b><span=
 lang=3D"EN-US"> Andrew MS1 Peng &lt;<a href=3D"mailto:pengms1@lenovo.com" =
target=3D"_blank">pengms1@lenovo.com</a>&gt;<br>
</span><b>=E6=8A=84=E9=80=81<span lang=3D"EN-US">:</span></b><span lang=3D"=
EN-US"> OpenBMC Maillist &lt;<a href=3D"mailto:openbmc@lists.ozlabs.org" ta=
rget=3D"_blank">openbmc@lists.ozlabs.org</a>&gt;; Duke KH Du &lt;<a href=3D=
"mailto:dukh@lenovo.com" target=3D"_blank">dukh@lenovo.com</a>&gt;;
<a href=3D"mailto:benjaminfair@google.com" target=3D"_blank">benjaminfair@g=
oogle.com</a>; Adriana Kobylak &lt;<a href=3D"mailto:anoo@us.ibm.com" targe=
t=3D"_blank">anoo@us.ibm.com</a>&gt;<br>
</span><b>=E4=B8=BB=E9=A2=98<span lang=3D"EN-US">:</span></b><span lang=3D"=
EN-US"> Re: [External] Re: Clarify some questions about in-band firmware up=
date</span></span><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">On Fri, Jun 28, 2019 at 7:09 AM=
 Patrick Venture &lt;<a href=3D"mailto:venture@google.com" target=3D"_blank=
">venture@google.com</a>&gt; wrote:<u></u><u></u></span></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0cm 0cm 0cm 6pt;margin:5pt 0c=
m 5pt 4.8pt">
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">On Fri, Jun 28, 2019 at 4:30 AM=
 Andrew MS1 Peng &lt;<a href=3D"mailto:pengms1@lenovo.com" target=3D"_blank=
">pengms1@lenovo.com</a>&gt; wrote:<u></u><u></u></span></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0cm 0cm 0cm 6pt;margin:5pt 0c=
m 5pt 4.8pt">
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:black">Hi Patrick,</span><span lang=3D"EN-US"><u></u><u></u>=
</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:black"><br>
I synchronized our Openbmc <span style=3D"background:white">repository=C2=
=A0</span>with <em>
<span style=3D"font-family:Calibri,sans-serif;background:white;font-style:n=
ormal">upstream</span></em><span style=3D"background:white">=C2=A0repositor=
y=C2=A0then compiled and checked the result yesterday, we can generate
<em><span style=3D"font-family:Calibri,sans-serif;font-style:normal">dynami=
cally linked binary but still failed to generate statically linked binary.=
=C2=A0
</span></em></span></span><span lang=3D"EN-US" style=3D"font-family:Calibri=
,sans-serif">I used
<em><span style=3D"font-family:Calibri,sans-serif;color:black;background:wh=
ite;font-style:normal">OpenBmc
</span></em>environment to compile and also created a SDK environment by us=
ing x86-64 toolchain (</span><span lang=3D"EN-US"><a href=3D"http://oecore-=
x86_64-core2-64-toolchain-nodistro.0.sh" target=3D"_blank"><span style=3D"f=
ont-family:Calibri,sans-serif">oecore-x86_64-core2-64-toolchain-nodistro.0.=
sh</span></a></span><span lang=3D"EN-US" style=3D"font-family:Calibri,sans-=
serif">)
 to compile, the compile result is the same. <em><span style=3D"font-family=
:Calibri,sans-serif;color:black;background:white;font-style:normal">It seem=
s to the linker not find the
</span></em><span style=3D"letter-spacing:-0.05pt;background:white">archive=
 file libpci.a,
</span><em><span style=3D"font-family:Calibri,sans-serif;color:black;backgr=
ound:white;font-style:normal">could you take a look my problem? Thanks.</sp=
an></em></span><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><em><span lang=3D"EN-US" style=3D"font-family:Calibr=
i,sans-serif;color:black;background:white;font-style:normal">=C2=A0</span><=
/em><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><em><span lang=3D"EN-US" style=3D"font-family:Calibr=
i,sans-serif;color:black;background:white;font-style:normal">I will get err=
or message when I run the tool in my host platform as
 below. The dynamically linked binary is not convenience to use since I hav=
e to modify
</span></em><span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;co=
lor:rgb(36,39,41);background:white">rpath and interpreter=C2=A0of already c=
ompiled ELF.
</span><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:12pt">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black;ba=
ckground:silver">pengms1@hsbmc: $ ./burn_my_bmc
</span><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:12pt">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black;ba=
ckground:silver">-bash: ./burn_my_bmc: No such file or directory<br>
<br>
pengms1@hsbmc: $ ldd ./burn_my_bmc<br>
<em><span style=3D"font-family:Calibri,sans-serif;font-style:normal">./burn=
_my_bmc: /lib/x86_64-linux-gnu/libpci.so.3: version `LIBPCI_3.5&#39; not fo=
und (required by ./burn_my_bmc)</span></em></span><span lang=3D"EN-US"><u><=
/u><u></u></span></p>
<p class=3D"MsoNormal"><em><span lang=3D"EN-US" style=3D"font-family:Calibr=
i,sans-serif;color:black;background:silver;font-style:normal">=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 linux-vdso.so.1 =3D&gt;=C2=A0 (0x00007ffcd2363000)=
</span></em><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><em><span lang=3D"EN-US" style=3D"font-family:Calibr=
i,sans-serif;color:black;background:silver;font-style:normal">=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 libipmiblob.so.0 =3D&gt; /home/pengms1/SDK/OpenBmc=
/rootfs/lib/libipmiblob.so.0
 (0x00007f25d373a000)</span></em><span lang=3D"EN-US"><u></u><u></u></span>=
</p>
<p class=3D"MsoNormal"><em><span lang=3D"EN-US" style=3D"font-family:Calibr=
i,sans-serif;color:black;background:silver;font-style:normal">=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 libpci.so.3 =3D&gt; /lib/x86_64-linux-gnu/libpci.s=
o.3 (0x00007f25d3512000)</span></em><span lang=3D"EN-US"><u></u><u></u></sp=
an></p>
<p class=3D"MsoNormal"><em><span lang=3D"EN-US" style=3D"font-family:Calibr=
i,sans-serif;color:black;background:silver;font-style:normal">=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 libstdc++.so.6 =3D&gt; /usr/lib/x86_64-linux-gnu/l=
ibstdc++.so.6
 (0x00007f25d3190000)</span></em><span lang=3D"EN-US"><u></u><u></u></span>=
</p>
<p class=3D"MsoNormal"><em><span lang=3D"EN-US" style=3D"font-family:Calibr=
i,sans-serif;color:black;background:silver;font-style:normal">=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 libgcc_s.so.1 =3D&gt; /lib/x86_64-linux-gnu/libgcc=
_s.so.1 (0x00007f25d2f79000)</span></em><span lang=3D"EN-US"><u></u><u></u>=
</span></p>
<p class=3D"MsoNormal"><em><span lang=3D"EN-US" style=3D"font-family:Calibr=
i,sans-serif;color:black;background:silver;font-style:normal">=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 libc.so.6 =3D&gt; /lib/x86_64-linux-gnu/libc.so.6 =
(0x00007f25d2baf000)</span></em><span lang=3D"EN-US"><u></u><u></u></span><=
/p>
<p class=3D"MsoNormal"><em><span lang=3D"EN-US" style=3D"font-family:Calibr=
i,sans-serif;color:black;background:silver;font-style:normal">=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 libm.so.6 =3D&gt; /lib/x86_64-linux-gnu/libm.so.6 =
(0x00007f25d28a6000)</span></em><span lang=3D"EN-US"><u></u><u></u></span><=
/p>
<p class=3D"MsoNormal"><em><span lang=3D"EN-US" style=3D"font-family:Calibr=
i,sans-serif;color:black;background:silver;font-style:normal">=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 libz.so.1 =3D&gt; /lib/x86_64-linux-gnu/libz.so.1 =
(0x00007f25d268b000)</span></em><span lang=3D"EN-US"><u></u><u></u></span><=
/p>
<p class=3D"MsoNormal"><em><span lang=3D"EN-US" style=3D"font-family:Calibr=
i,sans-serif;color:black;background:silver;font-style:normal">=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 libresolv.so.2 =3D&gt; /lib/x86_64-linux-gnu/libre=
solv.so.2 (0x00007f25d2470000)</span></em><span lang=3D"EN-US"><u></u><u></=
u></span></p>
<p class=3D"MsoNormal"><em><span lang=3D"EN-US" style=3D"font-family:Calibr=
i,sans-serif;color:black;background:silver;font-style:normal">=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 libudev.so.1 =3D&gt; /lib/x86_64-linux-gnu/libudev=
.so.1 (0x00007f25d2450000)</span></em><span lang=3D"EN-US"><u></u><u></u></=
span></p>
<p class=3D"MsoNormal"><em><span lang=3D"EN-US" style=3D"font-family:Calibr=
i,sans-serif;color:black;background:silver;font-style:normal">=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 /lib/ld-linux-x86-64.so.2 =3D&gt; /lib64/ld-linux-=
x86-64.so.2 (0x000055731193b000)</span></em><span lang=3D"EN-US"><u></u><u>=
</u></span></p>
<p class=3D"MsoNormal"><em><span lang=3D"EN-US" style=3D"font-family:Calibr=
i,sans-serif;color:black;background:silver;font-style:normal">=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 librt.so.1 =3D&gt; /lib/x86_64-linux-gnu/librt.so.=
1 (0x00007f25d2247000)</span></em><span lang=3D"EN-US"><u></u><u></u></span=
></p>
<p class=3D"MsoNormal"><em><span lang=3D"EN-US" style=3D"font-family:Calibr=
i,sans-serif;color:black;background:silver;font-style:normal">=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 libpthread.so.0 =3D&gt; /lib/x86_64-linux-gnu/libp=
thread.so.0 (0x00007f25d202a000)</span></em><span lang=3D"EN-US"><u></u><u>=
</u></span></p>
<p class=3D"MsoNormal"><em><span lang=3D"EN-US" style=3D"font-family:=E5=AE=
=8B=E4=BD=93;color:black;background:white;font-style:normal">=C2=A0</span><=
/em><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-family:Calibri=
,sans-serif">The compile error message is below:</span></b><span lang=3D"EN=
-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif">x86_64-openbmc-linux-libtool: link: x86_64-openbmc-linux-g++ -m64=
 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/peng=
ms1/openbmc_trunk_x86/build/tmp/work/core2-64-openbmc-linux/phosphor-ipmi-f=
lash/0.1+gitAUTOINC+7c79b252c1-r1/recipe-sysroot
 -std=3Dc++17 -I../../git -O2 -pipe -g -feliminate-unused-debug-types -fmac=
ro-prefix-map=3D/home/pengms1/openbmc_trunk_x86/build/tmp/work/core2-64-ope=
nbmc-linux/phosphor-ipmi-flash/0.1+gitAUTOINC+7c79b252c1-r1=3D/usr/src/debu=
g/phosphor-ipmi-flash/0.1+gitAUTOINC+7c79b252c1-r1
 -fdebug-prefix-map=3D/home/pengms1/openbmc_trunk_x86/build/tmp/work/core2-=
64-openbmc-linux/phosphor-ipmi-flash/0.1+gitAUTOINC+7c79b252c1-r1=3D/usr/sr=
c/debug/phosphor-ipmi-flash/0.1+gitAUTOINC+7c79b252c1-r1 -fdebug-prefix-map=
=3D/home/pengms1/openbmc_trunk_x86/build/tmp/work/core2-64-openbmc-linux/ph=
osphor-ipmi-flash/0.1+gitAUTOINC+7c79b252c1-r1/recipe-sysroot=3D
 -fdebug-prefix-map=3D/home/pengms1/openbmc_trunk_x86/build/tmp/work/core2-=
64-openbmc-linux/phosphor-ipmi-flash/0.1+gitAUTOINC+7c79b252c1-r1/recipe-sy=
sroot-native=3D -fvisibility-inlines-hidden -Wall -Werror -DENABLE_REBOOT_U=
PDATE -DENABLE_STATIC_LAYOUT -DENABLE_LPC_BRIDGE
 -DASPEED_LPC -static -o burn_my_bmc burn_my_bmc-main.o=C2=A0 ./.libs/libup=
dater.a -lipmiblob -lpci</span><span lang=3D"EN-US"><u></u><u></u></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif">| /home/pengms1/openbmc_trunk_x86/build/tmp/work/core2-64-openbmc=
-linux/phosphor-ipmi-flash/0.1+gitAUTOINC+7c79b252c1-r1/recipe-sysroot-nati=
ve/usr/bin/x86_64-openbmc-linux/../../libexec/x86_64-openbmc-linux/gcc/x86_=
64-openbmc-linux/9.1.0/ld:
<b><span style=3D"color:red">cannot find -lpci</span></b></span><span lang=
=3D"EN-US"><u></u><u></u></span></p>
</div>
</div>
</blockquote>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">That&#39;s indicating that it c=
ouldn&#39;t find the pciutils installed.=C2=A0 Like I said yesterday, I had=
n&#39;t tried to build the host-tool in this environment and had to clean
 up the dependency checks for it.=C2=A0 That said, I went through and fixed=
 it all and got it to build as expected from a pure ubuntu docker container=
.=C2=A0 Those patches are up for review and not yet in OpenBMC.=C2=A0 That =
said, I dont&#39; know why the lpci might not be found
 for that compilation other than possibly the pciutils recipe is broken.=C2=
=A0 I found yesterday while getting this to work that the instructions on t=
he pciutils README weren&#39;t quite right for building the library AND ins=
talling that library.<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">So I wrote up custom instructio=
ns in the README for phosphor-ipmi-flash, that patch is under review.<u></u=
><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">If you want to debut your curre=
nt environment, you need to see if you can find the pkgconfig file and libr=
aries defined:<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><a href=3D"https://github.com/p=
ciutils/pciutils/blob/master/lib/libpci.pc.in" target=3D"_blank">https://gi=
thub.com/pciutils/pciutils/blob/master/lib/libpci.pc.in</a><u></u><u></u></=
span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Basically search for libpci.pc =
and then read that file.=C2=A0 Verify the shared library objects are in the=
=C2=A0</span><span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif">=
SDK
 environment.</span><span lang=3D"EN-US"><u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif">If you need the libpci archive object for static compilation, tha=
t may not be installed by default, you&#39;ll want to read
 the pciutils README.</span><span lang=3D"EN-US"><u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0cm 0cm 0cm 6pt;margin:5pt 0c=
m 5pt 4.8pt">
<div>
<div>
<p class=3D"MsoNormal"><em><span lang=3D"EN-US" style=3D"font-family:=E5=AE=
=8B=E4=BD=93;color:black;background:white;font-style:normal">=C2=A0</span><=
/em><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><em><b><span lang=3D"EN-US" style=3D"font-family:Cal=
ibri,sans-serif;color:black;background:white;font-style:normal">My OpenBmc =
build
</span></b></em><b><span lang=3D"EN-US" style=3D"font-family:Calibri,sans-s=
erif">environment is below.</span></b><span lang=3D"EN-US"><u></u><u></u></=
span></p>
<table class=3D"gmail-m_1545270694092823127MsoNormalTable" border=3D"0" cel=
lspacing=3D"0" cellpadding=3D"0" style=3D"border-collapse:collapse">
<tbody>
<tr>
<td width=3D"230" valign=3D"top" style=3D"width:232.4pt;border:1pt solid wi=
ndowtext;background:yellow;padding:0cm 5.4pt">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif">OpenBmc Setting</span><span lang=3D"EN-US"><u></u><u></u></span><=
/p>
</td>
<td width=3D"284" valign=3D"top" style=3D"width:263.35pt;border-top:1pt sol=
id windowtext;border-right:1pt solid windowtext;border-bottom:1pt solid win=
dowtext;border-left:none;background:yellow;padding:0cm 5.4pt">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif">phosphor-ipmi-flash setting (<span style=3D"color:red">build
<em><span style=3D"font-family:Calibri,sans-serif;background:yellow;font-st=
yle:normal">static binary</span></em></span>)</span><span lang=3D"EN-US"><u=
></u><u></u></span></p>
</td>
<td width=3D"139" valign=3D"top" style=3D"width:120.5pt;border-top:1pt soli=
d windowtext;border-right:1pt solid windowtext;border-bottom:1pt solid wind=
owtext;border-left:none;background:yellow;padding:0cm 5.4pt">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif">Extra setting
</span><span lang=3D"EN-US"><u></u><u></u></span></p>
</td>
</tr>
<tr style=3D"height:130.5pt">
<td width=3D"230" rowspan=3D"3" valign=3D"top" style=3D"width:232.4pt;borde=
r-right:1pt solid windowtext;border-bottom:1pt solid windowtext;border-left=
:1pt solid windowtext;border-top:none;padding:0cm 5.4pt;height:130.5pt">
<p class=3D"MsoNormal"><em><span lang=3D"EN-US" style=3D"font-family:Calibr=
i,sans-serif;color:black;background:white;font-style:normal">Build Configur=
ation:</span></em><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><em><span lang=3D"EN-US" style=3D"font-family:Calibr=
i,sans-serif;color:black;background:white;font-style:normal">BB_VERSION=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;1.43.0&=
quot;</span></em><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><em><span lang=3D"EN-US" style=3D"font-family:Calibr=
i,sans-serif;color:black;background:white;font-style:normal">BUILD_SYS=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;x=
86_64-linux&quot;</span></em><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><em><span lang=3D"EN-US" style=3D"font-family:Calibr=
i,sans-serif;color:black;background:white;font-style:normal">NATIVELSBSTRIN=
G=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;ubuntu-16.04&quot;</span></em><sp=
an lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><em><span lang=3D"EN-US" style=3D"font-family:Calibr=
i,sans-serif;color:black;background:white;font-style:normal">TARGET_SYS=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;x86_64-=
openbmc-linux&quot;</span></em><span lang=3D"EN-US"><u></u><u></u></span></=
p>
<p class=3D"MsoNormal"><em><span lang=3D"EN-US" style=3D"font-family:Calibr=
i,sans-serif;color:black;background:white;font-style:normal">MACHINE=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=3D &quot;qemux86-64&quot;</span></em><span lang=3D"EN-US"><u></u><u></u></=
span></p>
<p class=3D"MsoNormal"><em><span lang=3D"EN-US" style=3D"font-family:Calibr=
i,sans-serif;color:black;background:white;font-style:normal">DISTRO=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 =3D &quot;openbmc-phosphor&quot;</span></em><span lang=3D"EN-US"><u></u=
><u></u></span></p>
<p class=3D"MsoNormal"><em><span lang=3D"EN-US" style=3D"font-family:Calibr=
i,sans-serif;color:black;background:white;font-style:normal">DISTRO_VERSION=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;0.1.2&quot;</span></em><span=
 lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><em><span lang=3D"EN-US" style=3D"font-family:Calibr=
i,sans-serif;color:black;background:white;font-style:normal">TUNE_FEATURES=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;m64 core2&quot;</span>=
</em><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><em><span lang=3D"EN-US" style=3D"font-family:Calibr=
i,sans-serif;color:black;background:white;font-style:normal">TARGET_FPU=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;&quot;<=
/span></em><span lang=3D"EN-US"><u></u><u></u></span></p>
</td>
<td width=3D"284" valign=3D"top" style=3D"width:263.35pt;border-top:none;bo=
rder-left:none;border-bottom:1pt solid windowtext;border-right:1pt solid wi=
ndowtext;padding:0cm 5.4pt;height:130.5pt">
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt"><span lang=3D"EN-US" st=
yle=3D"font-family:Calibri,sans-serif">EXTRA_OECONF +=3D &quot; --enable-bu=
ild-host-tool --enable-static-layout --enable-lpc-bridge
<br>
--enable-aspeed-lpc MAPPED_ADDRESS=3D0x98000000 --enable-reboot-update &quo=
t;</span><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif">EXTRA_OEMAKE +=3D &quot; LDFLAGS=3D-all-static &quot;
<span style=3D"color:red">(Build a <em><span style=3D"font-family:Calibri,s=
ans-serif;background:white;font-style:normal">statically linked binary</spa=
n></em>)</span></span><span lang=3D"EN-US"><u></u><u></u></span></p>
</td>
<td width=3D"139" rowspan=3D"3" valign=3D"top" style=3D"width:120.5pt;borde=
r-top:none;border-left:none;border-bottom:1pt solid windowtext;border-right=
:1pt solid windowtext;padding:0cm 5.4pt;height:130.5pt">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif">DISABLE_STATIC =3D &quot;&quot;=C2=A0 (<span style=3D"color:red">=
Build
<em><span style=3D"font-family:Calibri,sans-serif;background:white;font-sty=
le:normal">statically library for
</span></em>ipmi-blob-tool)</span></span><span lang=3D"EN-US"><u></u><u></u=
></span></p>
</td>
</tr>
<tr style=3D"height:23.25pt">
<td width=3D"284" valign=3D"top" style=3D"width:263.35pt;border-top:none;bo=
rder-left:none;border-bottom:1pt solid windowtext;border-right:1pt solid wi=
ndowtext;background:yellow;padding:0cm 5.4pt;height:23.25pt">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif">phosphor-ipmi-flash setting (<span style=3D"color:red">build
<em><span style=3D"font-family:Calibri,sans-serif;background:yellow;font-st=
yle:normal">dynamic binary</span></em></span>)</span><span lang=3D"EN-US"><=
u></u><u></u></span></p>
</td>
</tr>
<tr style=3D"height:79.75pt">
<td width=3D"284" valign=3D"top" style=3D"width:263.35pt;border-top:none;bo=
rder-left:none;border-bottom:1pt solid windowtext;border-right:1pt solid wi=
ndowtext;padding:0cm 5.4pt;height:79.75pt">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif">EXTRA_OECONF +=3D &quot; --enable-build-host-tool --enable-static=
-layout --enable-lpc-bridge
<br>
--enable-aspeed-lpc MAPPED_ADDRESS=3D0x98000000 --enable-reboot-update &quo=
t;</span><span lang=3D"EN-US"><u></u><u></u></span></p>
</td>
</tr>
</tbody>
</table>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:black">=C2=A0</s=
pan><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:black">Regards,<br>
Andrew</span><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:=E7=AD=89=E7=BA=BF;color:rgb(31,73,125)">=C2=A0</span><span lang=3D"=
EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><b><span style=3D"font-size:11pt;font-family:=E7=AD=
=89=E7=BA=BF">=E5=8F=91=E4=BB=B6=E4=BA=BA<span lang=3D"EN-US">:</span></spa=
n></b><span lang=3D"EN-US" style=3D"font-size:11pt;font-family:=E7=AD=89=E7=
=BA=BF"> Patrick Venture &lt;</span><span lang=3D"EN-US"><a href=3D"mailto:=
venture@google.com" target=3D"_blank"><span style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">venture@google.com</span></a></span><span lang=3D"=
EN-US" style=3D"font-size:11pt;font-family:=E7=AD=89=E7=BA=BF">&gt;
<br>
</span><b><span style=3D"font-size:11pt;font-family:=E7=AD=89=E7=BA=BF">=E5=
=8F=91=E9=80=81=E6=97=B6=E9=97=B4<span lang=3D"EN-US">:</span></span></b><s=
pan lang=3D"EN-US" style=3D"font-size:11pt;font-family:=E7=AD=89=E7=BA=BF">=
 2019</span><span style=3D"font-size:11pt;font-family:=E7=AD=89=E7=BA=BF">=
=E5=B9=B4<span lang=3D"EN-US">6</span>=E6=9C=88<span lang=3D"EN-US">27</spa=
n>=E6=97=A5<span lang=3D"EN-US">
 9:59<br>
</span><b>=E6=94=B6=E4=BB=B6=E4=BA=BA<span lang=3D"EN-US">:</span></b><span=
 lang=3D"EN-US"> Andrew MS1 Peng &lt;</span></span><span lang=3D"EN-US"><a =
href=3D"mailto:pengms1@lenovo.com" target=3D"_blank"><span style=3D"font-si=
ze:11pt;font-family:=E7=AD=89=E7=BA=BF">pengms1@lenovo.com</span></a></span=
><span lang=3D"EN-US" style=3D"font-size:11pt;font-family:=E7=AD=89=E7=BA=
=BF">&gt;;
 OpenBMC Maillist &lt;</span><span lang=3D"EN-US"><a href=3D"mailto:openbmc=
@lists.ozlabs.org" target=3D"_blank"><span style=3D"font-size:11pt;font-fam=
ily:=E7=AD=89=E7=BA=BF">openbmc@lists.ozlabs.org</span></a></span><span lan=
g=3D"EN-US" style=3D"font-size:11pt;font-family:=E7=AD=89=E7=BA=BF">&gt;<br=
>
</span><b><span style=3D"font-size:11pt;font-family:=E7=AD=89=E7=BA=BF">=E6=
=8A=84=E9=80=81<span lang=3D"EN-US">:</span></span></b><span lang=3D"EN-US"=
 style=3D"font-size:11pt;font-family:=E7=AD=89=E7=BA=BF"> Duke KH Du &lt;</=
span><span lang=3D"EN-US"><a href=3D"mailto:dukh@lenovo.com" target=3D"_bla=
nk"><span style=3D"font-size:11pt;font-family:=E7=AD=89=E7=BA=BF">dukh@leno=
vo.com</span></a></span><span lang=3D"EN-US" style=3D"font-size:11pt;font-f=
amily:=E7=AD=89=E7=BA=BF">&gt;;
</span><span lang=3D"EN-US"><a href=3D"mailto:benjaminfair@google.com" targ=
et=3D"_blank"><span style=3D"font-size:11pt;font-family:=E7=AD=89=E7=BA=BF"=
>benjaminfair@google.com</span></a></span><span lang=3D"EN-US" style=3D"fon=
t-size:11pt;font-family:=E7=AD=89=E7=BA=BF">; Adriana Kobylak &lt;</span><s=
pan lang=3D"EN-US"><a href=3D"mailto:anoo@us.ibm.com" target=3D"_blank"><sp=
an style=3D"font-size:11pt;font-family:=E7=AD=89=E7=BA=BF">anoo@us.ibm.com<=
/span></a></span><span lang=3D"EN-US" style=3D"font-size:11pt;font-family:=
=E7=AD=89=E7=BA=BF">&gt;<br>
</span><b><span style=3D"font-size:11pt;font-family:=E7=AD=89=E7=BA=BF">=E4=
=B8=BB=E9=A2=98<span lang=3D"EN-US">:</span></span></b><span lang=3D"EN-US"=
 style=3D"font-size:11pt;font-family:=E7=AD=89=E7=BA=BF"> [External] Re: Cl=
arify some questions about in-band firmware update</span><span lang=3D"EN-U=
S"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">On Wed, Jun 26, 2019 at 7:44 AM=
 Patrick Venture &lt;<a href=3D"mailto:venture@google.com" target=3D"_blank=
">venture@google.com</a>&gt; wrote:<u></u><u></u></span></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0cm 0cm 0cm 6pt;margin:5pt 0c=
m 5pt 4.8pt">
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">On Wed, Jun 26, 2019 at 4:28 AM=
 Andrew MS1 Peng &lt;<a href=3D"mailto:pengms1@lenovo.com" target=3D"_blank=
">pengms1@lenovo.com</a>&gt; wrote:<u></u><u></u></span></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0cm 0cm 0cm 6pt;margin:5pt 0c=
m 5pt 4.8pt">
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif">Hi Patrick,</span><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif">=C2=A0</span><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:black">I have some questions as below, could you help to cla=
rify. Thanks.</span><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"gmail-m_1545270694092823127gmail-m-8411625341099404742gmail-m17=
88754371567513735gmail-m6436252274273416049gmail-m-4871403681716629123gmail=
-m5865277644764564145gmail-m5232517683823064206gmail-m-6091798217660211465g=
mail-m-7106965077525685122msolistparagraph" style=3D"margin-left:18pt">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black">1=
.</span><span lang=3D"EN-US" style=3D"font-size:7pt;font-family:&quot;Times=
 New Roman&quot;,serif;color:black">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
</span><span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:b=
lack">Do you have any plans to support BIOS update in phosphor-ipmi-flash?<=
/span><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"gmail-m_1545270694092823127gmail-m-8411625341099404742gmail-m17=
88754371567513735gmail-m6436252274273416049gmail-m-4871403681716629123gmail=
-m5865277644764564145gmail-m5232517683823064206gmail-m-6091798217660211465g=
mail-m-7106965077525685122msolistparagraph" style=3D"margin-left:18pt">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black">I=
f the answer is no, we would like to help to add this feature. Could you gi=
ve us some advice or clues to implement it.</span><span lang=3D"EN-US"><u><=
/u><u></u></span></p>
</div>
</div>
</blockquote>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">This could be added to the desi=
gn (first step).<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I could probably roll out this =
in a day or two, it&#39;s not a difficult extension with a few caveats. We&=
#39;d have to define new services, such as update_bios.service
 instead=C2=A0of update_bmc.service.<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I have some cycles, so I don&#3=
9;t mind reviewing the changes required and rolling something out --=C2=A0<=
u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0cm 0cm 0cm 6pt;margin:5pt 0c=
m 5pt 4.8pt">
<div>
<div>
<p class=3D"gmail-m_1545270694092823127gmail-m-8411625341099404742gmail-m17=
88754371567513735gmail-m6436252274273416049gmail-m-4871403681716629123gmail=
-m5865277644764564145gmail-m5232517683823064206gmail-m-6091798217660211465g=
mail-m-7106965077525685122msolistparagraph" style=3D"margin-left:18pt">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black">2=
.</span><span lang=3D"EN-US" style=3D"font-size:7pt;font-family:&quot;Times=
 New Roman&quot;,serif;color:black">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
</span><span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:b=
lack">The FPGA rom image is embedded in BMC image, we would like to add fpg=
a-update.service and fpga-verify.service in phosphor-ipmi-flash, we expect =
that run both services after update
 BMC image completely. Do you have any concerns about it?</span><span lang=
=3D"EN-US"><u></u><u></u></span></p>
</div>
</div>
</blockquote>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">There are a couple things to un=
pack here.=C2=A0 The FPGA rom is embedded in the BMC image.=C2=A0 How is th=
e BMC updated?=C2=A0 I ask because a machine can (and is expected to)
 provide its own update_bmc.service implementation.=C2=A0 This service coul=
d trigger the fpga-verify and fpga-update services within whatever code is =
called from the update_bmc service you specify.<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0cm 0cm 0cm 6pt;margin:5pt 0c=
m 5pt 4.8pt">
<div>
<div>
<p class=3D"gmail-m_1545270694092823127gmail-m-8411625341099404742gmail-m17=
88754371567513735gmail-m6436252274273416049gmail-m-4871403681716629123gmail=
-m5865277644764564145gmail-m5232517683823064206gmail-m-6091798217660211465g=
mail-m-7106965077525685122msolistparagraph" style=3D"margin-left:18pt">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black">3=
.</span><span lang=3D"EN-US" style=3D"font-size:7pt;font-family:&quot;Times=
 New Roman&quot;,serif;color:black">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
</span><span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:b=
lack">How can I make a static executable host tool (burn_my_bmc)? Currently=
, I can=E2=80=99t to make a
<em><span style=3D"font-family:Calibri,sans-serif;background:white;font-sty=
le:normal">statically linked binary successfully</span></em>, but I have ma=
de it before you added p2a function.</span><span lang=3D"EN-US"><u></u><u><=
/u></span></p>
</div>
</div>
</blockquote>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">For the host tool you need to s=
pecify very little, you should be able to build it via:<u></u><u></u></span=
></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">./bootstrap.sh<u></u><u></u></s=
pan></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">./configure<u></u><u></u></span=
></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">./make<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">You will need to checkout and i=
nstall ipmi-blob-tool first (openbmc/ipmi-blob-tool)<u></u><u></u></span></=
p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">^^ --- those steps should go on=
 the README.=C2=A0 Will add them shortly.<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0cm 0cm 0cm 6pt;margin:5pt 0c=
m 5pt 4.8pt">
<div>
<div>
<p class=3D"gmail-m_1545270694092823127gmail-m-8411625341099404742gmail-m17=
88754371567513735gmail-m6436252274273416049gmail-m-4871403681716629123gmail=
-m5865277644764564145gmail-m5232517683823064206gmail-m-6091798217660211465g=
mail-m-7106965077525685122msolistparagraph" style=3D"margin-left:18pt">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black">B=
ased on different OS
</span><span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif">enviro=
nment as below,
<span style=3D"color:black">I would like to have a static executable since =
<em><span style=3D"font-family:Calibri,sans-serif;background:white;font-sty=
le:normal">dynamically linked binary can=E2=80=99t work normally in host OS=
.</span></em></span></span><span lang=3D"EN-US"><u></u><u></u></span></p>
<table class=3D"gmail-m_1545270694092823127MsoNormalTable" border=3D"0" cel=
lspacing=3D"0" cellpadding=3D"0" style=3D"margin-left:18pt;border-collapse:=
collapse">
<tbody>
<tr>
<td width=3D"288" valign=3D"top" style=3D"width:215.75pt;border:1pt solid w=
indowtext;padding:0cm 5.4pt">
<p class=3D"gmail-m_1545270694092823127gmail-m-8411625341099404742gmail-m17=
88754371567513735gmail-m6436252274273416049gmail-m-4871403681716629123gmail=
-m5865277644764564145gmail-m5232517683823064206gmail-m-6091798217660211465g=
mail-m-7106965077525685122msolistparagraph">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif">Host OS envir=
onment</span><span lang=3D"EN-US"><u></u><u></u></span></p>
</td>
<td width=3D"288" valign=3D"top" style=3D"width:215.75pt;border-top:1pt sol=
id windowtext;border-right:1pt solid windowtext;border-bottom:1pt solid win=
dowtext;border-left:none;padding:0cm 5.4pt">
<p class=3D"gmail-m_1545270694092823127gmail-m-8411625341099404742gmail-m17=
88754371567513735gmail-m6436252274273416049gmail-m-4871403681716629123gmail=
-m5865277644764564145gmail-m5232517683823064206gmail-m-6091798217660211465g=
mail-m-7106965077525685122msolistparagraph">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif">Build environ=
ment (OpenBmc)</span><span lang=3D"EN-US"><u></u><u></u></span></p>
</td>
</tr>
<tr>
<td width=3D"288" valign=3D"top" style=3D"width:215.75pt;border-right:1pt s=
olid windowtext;border-bottom:1pt solid windowtext;border-left:1pt solid wi=
ndowtext;border-top:none;padding:0cm 5.4pt">
<p class=3D"gmail-m_1545270694092823127gmail-m-8411625341099404742gmail-m17=
88754371567513735gmail-m6436252274273416049gmail-m-4871403681716629123gmail=
-m5865277644764564145gmail-m5232517683823064206gmail-m-6091798217660211465g=
mail-m-7106965077525685122msolistparagraph">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif">Gcc=C2=A0 v4.=
8.5</span><span lang=3D"EN-US"><u></u><u></u></span></p>
</td>
<td width=3D"288" valign=3D"top" style=3D"width:215.75pt;border-top:none;bo=
rder-left:none;border-bottom:1pt solid windowtext;border-right:1pt solid wi=
ndowtext;padding:0cm 5.4pt">
<p class=3D"gmail-m_1545270694092823127gmail-m-8411625341099404742gmail-m17=
88754371567513735gmail-m6436252274273416049gmail-m-4871403681716629123gmail=
-m5865277644764564145gmail-m5232517683823064206gmail-m-6091798217660211465g=
mail-m-7106965077525685122msolistparagraph">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif">Gcc=C2=A0=C2=
=A0 v8.3.0</span><span lang=3D"EN-US"><u></u><u></u></span></p>
</td>
</tr>
<tr>
<td width=3D"288" valign=3D"top" style=3D"width:215.75pt;border-right:1pt s=
olid windowtext;border-bottom:1pt solid windowtext;border-left:1pt solid wi=
ndowtext;border-top:none;padding:0cm 5.4pt">
<p class=3D"gmail-m_1545270694092823127gmail-m-8411625341099404742gmail-m17=
88754371567513735gmail-m6436252274273416049gmail-m-4871403681716629123gmail=
-m5865277644764564145gmail-m5232517683823064206gmail-m-6091798217660211465g=
mail-m-7106965077525685122msolistparagraph">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif">Glibc=C2=A0 v=
2.17</span><span lang=3D"EN-US"><u></u><u></u></span></p>
</td>
<td width=3D"288" valign=3D"top" style=3D"width:215.75pt;border-top:none;bo=
rder-left:none;border-bottom:1pt solid windowtext;border-right:1pt solid wi=
ndowtext;padding:0cm 5.4pt">
<p class=3D"gmail-m_1545270694092823127gmail-m-8411625341099404742gmail-m17=
88754371567513735gmail-m6436252274273416049gmail-m-4871403681716629123gmail=
-m5865277644764564145gmail-m5232517683823064206gmail-m-6091798217660211465g=
mail-m-7106965077525685122msolistparagraph">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif">Glibc=C2=A0 v=
2.29</span><span lang=3D"EN-US"><u></u><u></u></span></p>
</td>
</tr>
</tbody>
</table>
</div>
</div>
</blockquote>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">The bitbake recipe isn&#39;t me=
ant to be used for the host tool.=C2=A0 It explicitly disables building the=
 host-tool by default.=C2=A0 You should be able to check out the repo
 and build from there.=C2=A0 Let me know if you run into issues with that.<=
u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0cm 0cm 0cm 6pt;margin:5pt 0c=
m 5pt 4.8pt">
<div>
<div>
<p class=3D"gmail-m_1545270694092823127gmail-m-8411625341099404742gmail-m17=
88754371567513735gmail-m6436252274273416049gmail-m-4871403681716629123gmail=
-m5865277644764564145gmail-m5232517683823064206gmail-m-6091798217660211465g=
mail-m-7106965077525685122msolistparagraph" style=3D"margin-left:18pt">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif">4.</span><spa=
n lang=3D"EN-US" style=3D"font-size:7pt;font-family:&quot;Times New Roman&q=
uot;,serif">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
</span><span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif">I didn=
=E2=80=99t find the below service files in source tree, where can find defa=
ult services or should we provide our own services?
</span><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"gmail-m_1545270694092823127gmail-m-8411625341099404742gmail-m17=
88754371567513735gmail-m6436252274273416049gmail-m-4871403681716629123gmail=
-m5865277644764564145gmail-m5232517683823064206gmail-m-6091798217660211465g=
mail-m-7106965077525685122msolistparagraph" style=3D"margin-left:18pt">
<code><span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif">update_=
bmc.service</span></code><span lang=3D"EN-US" style=3D"font-family:Calibri,=
sans-serif"><br>
<code><span style=3D"font-family:Calibri,sans-serif">verify_image.service</=
span></code><br>
<code><span style=3D"font-family:Calibri,sans-serif">prepare_update.service=
</span></code></span><span lang=3D"EN-US"><u></u><u></u></span></p>
</div>
</div>
</blockquote>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">That&#39;s correct.=C2=A0 There=
 are currently no default service files.=C2=A0 I am thinking of providing a=
 default prepare_update service in a later CL, however updating the
 BMC or verifying the image depend entirely on the system -- which makes it=
 difficult to have a default.=C2=A0 In point of fact, there isn&#39;t reall=
y a valid default phosphor-ipmi-flash build for a BMC.=C2=A0 Everything nee=
ds to be specified.<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">^--- I can work on making the u=
bi bmc option available if the ubi distro feature is enabled, etc -- provid=
ing some defaults.<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">^--- I have a plan to provide a=
 prepare_update.service once I finish testing Aspeed LPC support.<u></u><u>=
</u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
</div>
</div>
</div>
</blockquote>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I&#39;ve been reviewing the bui=
ld process for the host-tool and the configure file and other pieces requir=
e the BMC-stuff to be installed first (sdbusplus, etc).=C2=A0
 I&#39;m going to cleanup the configure file so that if you&#39;re building=
 the host-tool it doesn&#39;t try to build the BMC stuff.=C2=A0<u></u><u></=
u></span></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0cm 0cm 0cm 6pt;margin:5pt 0c=
m 5pt 4.8pt">
<div>
<div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0cm 0cm 0cm 6pt;margin:5pt 0c=
m 5pt 4.8pt">
<div>
<div>
<p class=3D"gmail-m_1545270694092823127gmail-m-8411625341099404742gmail-m17=
88754371567513735gmail-m6436252274273416049gmail-m-4871403681716629123gmail=
-m5865277644764564145gmail-m5232517683823064206gmail-m-6091798217660211465g=
mail-m-7106965077525685122msolistparagraph" style=3D"margin-left:18pt">
<span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif">=C2=A0</span><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif">Regards,<br>
Andrew</span><span lang=3D"EN-US"><u></u><u></u></span></p>
</div>
</div>
</blockquote>
</div>
</div>
</blockquote>
</div>
</div>
</div>
</div>
</blockquote>
</div>
</div>
</blockquote>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Andrew, the steps here should w=
ork for you to build out the host-tool:=C2=A0<a href=3D"https://github.com/=
openbmc/phosphor-ipmi-flash#building-and-using-the-host-tool" target=3D"_bl=
ank">https://github.com/openbmc/phosphor-ipmi-flash#building-and-using-the-=
host-tool</a><u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">That said, because you requeste=
d we support BIOS images too, I&#39;m looking at re-working some of the blo=
bIDs involved.=C2=A0 That said, the host-tool and BMC version
 are locked together.=C2=A0<u></u><u></u></span></p>
</div>
</div>
</div>
</div>
</div>
</blockquote>
</div>
</div>
</blockquote>
</div>
</div>
</blockquote>
</div>
</div>
</div>
</div>
</blockquote>
</div>
</div>
</div>
</div>

</blockquote></div></div>

--000000000000c90ef5058cf08563--
