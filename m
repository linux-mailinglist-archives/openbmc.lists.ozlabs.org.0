Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC7340ED69
	for <lists+openbmc@lfdr.de>; Fri, 17 Sep 2021 00:36:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H9X4w4C1cz2ygC
	for <lists+openbmc@lfdr.de>; Fri, 17 Sep 2021 08:36:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=pefnl7jd;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::22a;
 helo=mail-oi1-x22a.google.com; envelope-from=jjy@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=pefnl7jd; dkim-atps=neutral
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H9X4V67qcz2xvV
 for <openbmc@lists.ozlabs.org>; Fri, 17 Sep 2021 08:36:24 +1000 (AEST)
Received: by mail-oi1-x22a.google.com with SMTP id u22so2977112oie.5
 for <openbmc@lists.ozlabs.org>; Thu, 16 Sep 2021 15:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=10uaygv8F573ZcwY81iBmqUwSGun5XpTh/GYeqjeQeY=;
 b=pefnl7jdJxsgMsKy6NIcrv5S7R9/lRklRJBB41Pz4PI47S9taWq08VFcwT1xCsT7tu
 IzBQD9g7V1pqL9mMN4imQshBF9IN2ZzJxLvQymoXcZPqVk0hyJExEsZpuvYOFCFRF2bl
 wetoT4p4lmIIeSbdDSkc498ZI9rvR+jqGBzJwtj8vIwmq9dCDwFPiChFEaHleAM5JmwB
 hINPnfwQu2HcoFk0pcV/A6hhjIUnsafZ3E9H/l5ksQECRKdr64ENsyLPWPWrBlv3catf
 AJNEgNvKtdket9wEPeDEgs29YR5WdcDuXxgOBO6VqvnVdmXDTOaRYlClH21GcX6PzZU0
 7mSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=10uaygv8F573ZcwY81iBmqUwSGun5XpTh/GYeqjeQeY=;
 b=LBtiLcACwwFEdC6oXcwB3bN/BdiwIEK/2E//QNfReyykjp03BT6ObH+Sm5PxvRqBlt
 SmVIexq15Xp/qwwAtmMyky0fF4f2owRGh8vwJzavWsC8aclBSn/r9x385iBQAnHMc2fS
 dc0MaYenKSTi9ubBJBUfCGVxuNTUh87ZmMI2QmX0INE1bvUZfk0FwUu6ZA7JdT5+HuUF
 Y5iOWMQzuld5SrszEQzI1clUjTe4CK3FAW1RvEUDpNlTkHDHsNTBRw4lGrY+JFS7e64Q
 18U6qiZpYarPRz+zieqB8XZLS05N9jPul1ccxCzzNXnYel8sEG6YKXyu87jzFRriM+oI
 SRXg==
X-Gm-Message-State: AOAM533+kfrHCx9S3c139MujORptQUXB4PPyOmc4q9faGcaDO4o+HI/D
 C/3Y+SwSPBjVM02BSyAPhTcYes5LzqMbrl+qWs3pyw==
X-Google-Smtp-Source: ABdhPJwTeQmnRtOl0m933iUjNxjZBw3sCVMVgqT1XV4K4AYf+28G1BlY669khyk5gf/L87wvCx0FxVQOZf7hDUhQfgw=
X-Received: by 2002:a05:6808:308e:: with SMTP id
 bl14mr11317476oib.40.1631831780922; 
 Thu, 16 Sep 2021 15:36:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAMqwjCAaHrv0SgA_1hDEjjnX1fur6ijmCJCrn1gTPbr5Z2-ONw@mail.gmail.com>
 <d190054863c8112a66baad2f50dda7c6bdc45717.camel@yadro.com>
 <5f94cf85-6ded-3520-8ad2-592fade91e81@amperemail.onmicrosoft.com>
 <9ab79bcd06ad6b6cf574a8455247a767df8731ac.camel@yadro.com>
 <d93fc722-2a24-0921-56ee-b9968edbd6a6@amperemail.onmicrosoft.com>
 <4bda1bb5f09395003c95c645518f34828105b160.camel@yadro.com>
 <DF4PR8401MB06341BDD6521896375C0CF498FDB9@DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM>
 <HK0PR03MB5090C26890DAF0FBB36D883CCFDC9@HK0PR03MB5090.apcprd03.prod.outlook.com>
 <9f4b694e-bfc8-59d7-dec4-5ee8f762c4f5@amperemail.onmicrosoft.com>
In-Reply-To: <9f4b694e-bfc8-59d7-dec4-5ee8f762c4f5@amperemail.onmicrosoft.com>
From: Jie Yang <jjy@google.com>
Date: Thu, 16 Sep 2021 15:36:10 -0700
Message-ID: <CAAcJOwv4ieTTcYm60M043iXiWiC9=KNK31Pb7jheedqhr84VLg@mail.gmail.com>
Subject: Re: Read smbios2 file failed
To: Thang Nguyen <thang@amperemail.onmicrosoft.com>
Content-Type: multipart/alternative; boundary="000000000000a2f56905cc247171"
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
Cc: "Garrett, Mike \(HPE Server Firmware\)" <mike.garrett@hpe.com>,
 Andrei Kartashev <a.kartashev@yadro.com>, CS20 CHLi30 <chli30@nuvoton.com>,
 openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000a2f56905cc247171
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Actually I added an ipmi blob interface to smbios-mdr
 https://github.com/openbmc/smbios-mdr/tree/master/src/smbios-ipmi-blobs
<https://github.com/openbmc/smbios-mdr/tree/master/src/smbios-ipmi-blobs>.
With this interface you can send the smbios tables to BMC either through
LinuxBoot or host. The LinuxBoot code
https://github.com/u-root/u-root/tree/master/cmds/exp/smbios_transfer.
Writing and committing to this blob will generate the MDR header.

-Jie

On Thu, Sep 16, 2021 at 4:19 AM Thang Nguyen <
thang@amperemail.onmicrosoft.com> wrote:

> Thanks Tim, Mike and Andrei for very useful information. We can make it
> work by adding MDRv2 header.
>
> I am finding some information about the IPMI blobs commands. I can see
> some notes at
>
>
> https://github.com/openbmc/docs/blob/master/designs/binarystore-via-blobs=
.md
>
> https://github.com/openbmc/phosphor-ipmi-blobs/blob/master/README.md
>
> But I have not found more description about the IPMI blob commands like
> NetFn, Func, ... that I can send a file from Host to BMC. Do you have
> any information about them?
>
>
> Thanks,
>
> Thang Q. Nguyen
>
> On 16/09/2021 09:40, CS20 CHLi30 wrote:
> > Hi Thang,
> > Did you try to use smbios_entry_point or DMI from host to BMC
> /var/lib/smbios/smbios2 for parsing?
> >
> > You can refer this sysfs-firmware-dmi-tables as below:
> >
> > The firmware provides DMI structures as a packed list of data reference=
d
> by a SMBIOS table entry point.
> > The SMBIOS entry point contains general information, like SMBIOS
> version, DMI table size, etc.
> > The structure, content and size of SMBIOS entry point is dependent on
> SMBIOS version.
> >
> > The format of SMBIOS entry point and DMI structures can be read in
> SMBIOS specification.
> > The dmi/tables provides raw SMBIOS entry point and DMI tables through
> sysfs as an alternative to utilities reading them from /dev/mem.
> >
> > The raw SMBIOS entry point and DMI table are presented as binary
> attributes and are accessible via:
> > /sys/firmware/dmi/tables/smbios_entry_point
> > /sys/firmware/dmi/tables/DMI
> >
> > Best regards,
> > Tim
> >
> > -----Original Message-----
> > From: openbmc [mailto:openbmc-bounces+chli30=3D
> nuvoton.com@lists.ozlabs.org] On Behalf Of Garrett, Mike (HPE Server
> Firmware)
> > Sent: Wednesday, September 15, 2021 9:19 PM
> > To: Andrei Kartashev <a.kartashev@yadro.com>; Thang Nguyen <
> thang@amperemail.onmicrosoft.com>; openbmc <openbmc@lists.ozlabs.org>
> > Subject: RE: Read smbios2 file failed
> >
> > We recently did the same thing and got it working.  All you have to do
> is take the RAW smbios records blob in binary form (delivered as noted
> below in whatever way you choose) and prepend a specific header:
> https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithu=
b.com%2Fopenbmc%2Fsmbios-mdr%2Fblob%2F33c948a473bd273fea0cff82d4c99b70b7784=
be6%2Finclude%2Fsmbios_mdrv2.hpp%23L114&amp;data=3D04%7C01%7Cchli30%40nuvot=
on.com%7C81a4bd29e4904bf4d84608d978510b92%7Ca3f24931d4034b4a94f17d83ac638e0=
7%7C0%7C0%7C637673526954552742%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAi=
LCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DoQwcozsSo=
GlgSFwztPFV3FAoPpRZGYoZ7pc0%2BxDi1MA%3D&amp;reserved=3D0
> >
> > It is a little bit fragile as it introduces a dependency on the file
> download logic to write a non-standard header defined in another service
> that could potentially change.
> >
> > Mike
> >
> >> -----Original Message-----
> >> From: openbmc <openbmc-
> >> bounces+mike.garrett=3Dhpe.com@lists.ozlabs.org> On Behalf Of Andrei
> >> Kartashev
> >> Sent: Wednesday, September 15, 2021 3:17 AM
> >> To: Thang Nguyen <thang@amperemail.onmicrosoft.com>; openbmc
> >> <openbmc@lists.ozlabs.org>
> >> Subject: Re: Read smbios2 file failed
> >>
> >> I don't know what is format of "dmidecode --dump-bin", but if it just
> >> raw dump of smbios then you only need to add mdr header.
> >>
> >> See answer for the same question here:
> >> INVALID URI REMOVED
> >> 021-July/026882.html__;!!NpxR!2w0FkPs2KyaB6XOvB8et52bWKqAMLImmL-
> >> iUk9A_zZbJ8WLhMeXdvRAp-pcxt8Q$
> >>
> >> On Wed, 2021-09-15 at 12:41 +0700, Thang Nguyen wrote:
> >>> Hi Andrei,
> >>>
> >>> I see output of "dmidecode --dump-bin" follows SMBIOS specification.
> >>> As
> >>> the data for smbios-mdr does not follow this, do you know about the
> >>> document or any information I can reference to prepare data to send
> >>> to BMC??
> >>>
> >>>
> >>> Best Regards,
> >>>
> >>> Thang Q. Nguyen
> >>>
> >>> On 14/09/2021 15:51, Andrei Kartashev wrote:
> >>>> No, it is not same as "dmidecode --dump-bin".
> >>>>
> >>>> On Tue, 2021-09-14 at 13:46 +0700, Thang Nguyen wrote:
> >>>>> On 13/09/2021 23:56, Andrei Kartashev wrote:
> >>>>>> You need to somehow deliver smbios data image to BMC. This
> >>>>>> means, your BIOS should implementat some logic to transfer
> >>>>>> this data.
> >>>>>> For BMC side see example here:
> >>>>>> https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2
> >>>>>> F%2Fgithub.com%2Fopenbmc%2Fintel-ipmi-&amp;data=3D04%7C01%7Cchli
> >>>>>> 30%40nuvoton.com%7C81a4bd29e4904bf4d84608d978510b92%7Ca3f24931
> >>>>>> d4034b4a94f17d83ac638e07%7C0%7C0%7C637673526954552742%7CUnknow
> >>>>>> n%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik
> >>>>>> 1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DcG6ZZzOSXkuUtcQuuoymsRdP
> >>>>>> p24mINa%2FhCy%2BYhe%2FNmk%3D&amp;reserved=3D0
> >> oem/blob/master/src/smbios
> >>>>>> mdrv2handler.cpp
> >>>>> Hi Andrei,
> >>>>>
> >>>>> What is the format of smbios data to transfer to BMC? Is it the
> >>>>> same content of "dmidecode --dump-bin" command from Host Linux?
> >> or
> >>>>> anything special in formatting the content to send?
> >>>>>
> >>>>>> On Mon, 2021-09-13 at 17:40 +0300, Alexander Raih wrote:
> >>>>>>> Hi guys, I am beginner in openbmc I build openbmc with
> >>>>>>> smbios-mdr repository and I have error:
> >>>>>>>
> >>>>>>> Read data from flash error - Open MDRV2 table file failure
> >>>>>>>
> >>>>>>> There isnt file in /var/lib/smbios/smbios2
> >>>>>>>
> >>>>>>> How I can resolve this problem?
> >>>>>>> Help me please!!!
> >>
> >> --
> >> Best regards,
> >> Andrei Kartashev
> >>
> > ________________________________
> > ________________________________
> >   The privileged confidential information contained in this email is
> intended for use only by the addressees as indicated by the original send=
er
> of this email. If you are not the addressee indicated in this email or ar=
e
> not responsible for delivery of the email to such a person, please kindly
> reply to the sender indicating this fact and delete all copies of it from
> your computer and network server immediately. Your cooperation is highly
> appreciated. It is advised that any unauthorized use of confidential
> information of Nuvoton is strictly prohibited; and any information in thi=
s
> email irrelevant to the official business of Nuvoton shall be deemed as
> neither given nor endorsed by Nuvoton.
>

--000000000000a2f56905cc247171
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>Actually I added an ipmi blob inter=
face to smbios-mdr<a href=3D"https://github.com/openbmc/smbios-mdr/tree/mas=
ter/src/smbios-ipmi-blobs">=C2=A0https://github.com/openbmc/smbios-mdr/tree=
/master/src/smbios-ipmi-blobs</a>. With this interface you can send the smb=
ios tables to BMC either through LinuxBoot or host. The LinuxBoot code=C2=
=A0<a href=3D"https://github.com/u-root/u-root/tree/master/cmds/exp/smbios_=
transfer">https://github.com/u-root/u-root/tree/master/cmds/exp/smbios_tran=
sfer</a>. Writing and committing to this blob will generate the MDR header.=
</div><div><br></div><div>-Jie</div></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 16, 2021 at 4:19 AM Thang N=
guyen &lt;<a href=3D"mailto:thang@amperemail.onmicrosoft.com">thang@amperem=
ail.onmicrosoft.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">Thanks Tim, Mike and Andrei for very useful information.=
 We can make it <br>
work by adding MDRv2 header.<br>
<br>
I am finding some information about the IPMI blobs commands. I can see <br>
some notes at<br>
<br>
<a href=3D"https://github.com/openbmc/docs/blob/master/designs/binarystore-=
via-blobs.md" rel=3D"noreferrer" target=3D"_blank">https://github.com/openb=
mc/docs/blob/master/designs/binarystore-via-blobs.md</a><br>
<br>
<a href=3D"https://github.com/openbmc/phosphor-ipmi-blobs/blob/master/READM=
E.md" rel=3D"noreferrer" target=3D"_blank">https://github.com/openbmc/phosp=
hor-ipmi-blobs/blob/master/README.md</a><br>
<br>
But I have not found more description about the IPMI blob commands like <br=
>
NetFn, Func, ... that I can send a file from Host to BMC. Do you have <br>
any information about them?<br>
<br>
<br>
Thanks,<br>
<br>
Thang Q. Nguyen<br>
<br>
On 16/09/2021 09:40, CS20 CHLi30 wrote:<br>
&gt; Hi Thang,<br>
&gt; Did you try to use smbios_entry_point or DMI from host to BMC /var/lib=
/smbios/smbios2 for parsing?<br>
&gt;<br>
&gt; You can refer this sysfs-firmware-dmi-tables as below:<br>
&gt;<br>
&gt; The firmware provides DMI structures as a packed list of data referenc=
ed by a SMBIOS table entry point.<br>
&gt; The SMBIOS entry point contains general information, like SMBIOS versi=
on, DMI table size, etc.<br>
&gt; The structure, content and size of SMBIOS entry point is dependent on =
SMBIOS version.<br>
&gt;<br>
&gt; The format of SMBIOS entry point and DMI structures can be read in SMB=
IOS specification.<br>
&gt; The dmi/tables provides raw SMBIOS entry point and DMI tables through =
sysfs as an alternative to utilities reading them from /dev/mem.<br>
&gt;<br>
&gt; The raw SMBIOS entry point and DMI table are presented as binary attri=
butes and are accessible via:<br>
&gt; /sys/firmware/dmi/tables/smbios_entry_point<br>
&gt; /sys/firmware/dmi/tables/DMI<br>
&gt;<br>
&gt; Best regards,<br>
&gt; Tim<br>
&gt;<br>
&gt; -----Original Message-----<br>
&gt; From: openbmc [mailto:<a href=3D"mailto:openbmc-bounces%2Bchli30" targ=
et=3D"_blank">openbmc-bounces+chli30</a>=3D<a href=3D"mailto:nuvoton.com@li=
sts.ozlabs.org" target=3D"_blank">nuvoton.com@lists.ozlabs.org</a>] On Beha=
lf Of Garrett, Mike (HPE Server Firmware)<br>
&gt; Sent: Wednesday, September 15, 2021 9:19 PM<br>
&gt; To: Andrei Kartashev &lt;<a href=3D"mailto:a.kartashev@yadro.com" targ=
et=3D"_blank">a.kartashev@yadro.com</a>&gt;; Thang Nguyen &lt;<a href=3D"ma=
ilto:thang@amperemail.onmicrosoft.com" target=3D"_blank">thang@amperemail.o=
nmicrosoft.com</a>&gt;; openbmc &lt;<a href=3D"mailto:openbmc@lists.ozlabs.=
org" target=3D"_blank">openbmc@lists.ozlabs.org</a>&gt;<br>
&gt; Subject: RE: Read smbios2 file failed<br>
&gt;<br>
&gt; We recently did the same thing and got it working.=C2=A0 All you have =
to do is take the RAW smbios records blob in binary form (delivered as note=
d below in whatever way you choose) and prepend a specific header:=C2=A0 <a=
 href=3D"https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fgithub.com%2Fopenbmc%2Fsmbios-mdr%2Fblob%2F33c948a473bd273fea0cff82d4c99b=
70b7784be6%2Finclude%2Fsmbios_mdrv2.hpp%23L114&amp;amp;data=3D04%7C01%7Cchl=
i30%40nuvoton.com%7C81a4bd29e4904bf4d84608d978510b92%7Ca3f24931d4034b4a94f1=
7d83ac638e07%7C0%7C0%7C637673526954552742%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiM=
C4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sd=
ata=3DoQwcozsSoGlgSFwztPFV3FAoPpRZGYoZ7pc0%2BxDi1MA%3D&amp;amp;reserved=3D0=
" rel=3D"noreferrer" target=3D"_blank">https://apc01.safelinks.protection.o=
utlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2Fopenbmc%2Fsmbios-mdr%2Fblob%2F=
33c948a473bd273fea0cff82d4c99b70b7784be6%2Finclude%2Fsmbios_mdrv2.hpp%23L11=
4&amp;amp;data=3D04%7C01%7Cchli30%40nuvoton.com%7C81a4bd29e4904bf4d84608d97=
8510b92%7Ca3f24931d4034b4a94f17d83ac638e07%7C0%7C0%7C637673526954552742%7CU=
nknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLC=
JXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DoQwcozsSoGlgSFwztPFV3FAoPpRZGYoZ7pc0%2B=
xDi1MA%3D&amp;amp;reserved=3D0</a><br>
&gt;<br>
&gt; It is a little bit fragile as it introduces a dependency on the file d=
ownload logic to write a non-standard header defined in another service tha=
t could potentially change.<br>
&gt;<br>
&gt; Mike<br>
&gt;<br>
&gt;&gt; -----Original Message-----<br>
&gt;&gt; From: openbmc &lt;openbmc-<br>
&gt;&gt; bounces+mike.garrett=3D<a href=3D"mailto:hpe.com@lists.ozlabs.org"=
 target=3D"_blank">hpe.com@lists.ozlabs.org</a>&gt; On Behalf Of Andrei<br>
&gt;&gt; Kartashev<br>
&gt;&gt; Sent: Wednesday, September 15, 2021 3:17 AM<br>
&gt;&gt; To: Thang Nguyen &lt;<a href=3D"mailto:thang@amperemail.onmicrosof=
t.com" target=3D"_blank">thang@amperemail.onmicrosoft.com</a>&gt;; openbmc<=
br>
&gt;&gt; &lt;<a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blank">=
openbmc@lists.ozlabs.org</a>&gt;<br>
&gt;&gt; Subject: Re: Read smbios2 file failed<br>
&gt;&gt;<br>
&gt;&gt; I don&#39;t know what is format of &quot;dmidecode --dump-bin&quot=
;, but if it just<br>
&gt;&gt; raw dump of smbios then you only need to add mdr header.<br>
&gt;&gt;<br>
&gt;&gt; See answer for the same question here:<br>
&gt;&gt; INVALID URI REMOVED<br>
&gt;&gt; 021-July/026882.html__;!!NpxR!2w0FkPs2KyaB6XOvB8et52bWKqAMLImmL-<b=
r>
&gt;&gt; iUk9A_zZbJ8WLhMeXdvRAp-pcxt8Q$<br>
&gt;&gt;<br>
&gt;&gt; On Wed, 2021-09-15 at 12:41 +0700, Thang Nguyen wrote:<br>
&gt;&gt;&gt; Hi Andrei,<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I see output of &quot;dmidecode --dump-bin&quot; follows SMBIO=
S specification.<br>
&gt;&gt;&gt; As<br>
&gt;&gt;&gt; the data for smbios-mdr does not follow this, do you know abou=
t the<br>
&gt;&gt;&gt; document or any information I can reference to prepare data to=
 send<br>
&gt;&gt;&gt; to BMC??<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Best Regards,<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Thang Q. Nguyen<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On 14/09/2021 15:51, Andrei Kartashev wrote:<br>
&gt;&gt;&gt;&gt; No, it is not same as &quot;dmidecode --dump-bin&quot;.<br=
>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; On Tue, 2021-09-14 at 13:46 +0700, Thang Nguyen wrote:<br>
&gt;&gt;&gt;&gt;&gt; On 13/09/2021 23:56, Andrei Kartashev wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt; You need to somehow deliver smbios data image to B=
MC. This<br>
&gt;&gt;&gt;&gt;&gt;&gt; means, your BIOS should implementat some logic to =
transfer<br>
&gt;&gt;&gt;&gt;&gt;&gt; this data.<br>
&gt;&gt;&gt;&gt;&gt;&gt; For BMC side see example here:<br>
&gt;&gt;&gt;&gt;&gt;&gt; <a href=3D"https://apc01.safelinks.protection.outl=
ook.com/?url=3Dhttps%3A%2" rel=3D"noreferrer" target=3D"_blank">https://apc=
01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2</a><br>
&gt;&gt;&gt;&gt;&gt;&gt; F%2Fgithub.com%2Fopenbmc%2Fintel-ipmi-&amp;amp;dat=
a=3D04%7C01%7Cchli<br>
&gt;&gt;&gt;&gt;&gt;&gt; 30%<a href=3D"http://40nuvoton.com" rel=3D"norefer=
rer" target=3D"_blank">40nuvoton.com</a>%7C81a4bd29e4904bf4d84608d978510b92=
%7Ca3f24931<br>
&gt;&gt;&gt;&gt;&gt;&gt; d4034b4a94f17d83ac638e07%7C0%7C0%7C637673526954552=
742%7CUnknow<br>
&gt;&gt;&gt;&gt;&gt;&gt; n%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMz=
IiLCJBTiI6Ik<br>
&gt;&gt;&gt;&gt;&gt;&gt; 1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DcG6ZZz=
OSXkuUtcQuuoymsRdP<br>
&gt;&gt;&gt;&gt;&gt;&gt; p24mINa%2FhCy%2BYhe%2FNmk%3D&amp;amp;reserved=3D0<=
br>
&gt;&gt; oem/blob/master/src/smbios<br>
&gt;&gt;&gt;&gt;&gt;&gt; mdrv2handler.cpp<br>
&gt;&gt;&gt;&gt;&gt; Hi Andrei,<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; What is the format of smbios data to transfer to BMC? =
Is it the<br>
&gt;&gt;&gt;&gt;&gt; same content of &quot;dmidecode --dump-bin&quot; comma=
nd from Host Linux?<br>
&gt;&gt; or<br>
&gt;&gt;&gt;&gt;&gt; anything special in formatting the content to send?<br=
>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; On Mon, 2021-09-13 at 17:40 +0300, Alexander Raih =
wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; Hi guys, I am beginner in openbmc I build open=
bmc with<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; smbios-mdr repository and I have error:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; Read data from flash error - Open MDRV2 table =
file failure<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; There isnt file in /var/lib/smbios/smbios2<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; How I can resolve this problem?<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; Help me please!!!<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; Best regards,<br>
&gt;&gt; Andrei Kartashev<br>
&gt;&gt;<br>
&gt; ________________________________<br>
&gt; ________________________________<br>
&gt;=C2=A0 =C2=A0The privileged confidential information contained in this =
email is intended for use only by the addressees as indicated by the origin=
al sender of this email. If you are not the addressee indicated in this ema=
il or are not responsible for delivery of the email to such a person, pleas=
e kindly reply to the sender indicating this fact and delete all copies of =
it from your computer and network server immediately. Your cooperation is h=
ighly appreciated. It is advised that any unauthorized use of confidential =
information of Nuvoton is strictly prohibited; and any information in this =
email irrelevant to the official business of Nuvoton shall be deemed as nei=
ther given nor endorsed by Nuvoton.<br>
</blockquote></div>

--000000000000a2f56905cc247171--
