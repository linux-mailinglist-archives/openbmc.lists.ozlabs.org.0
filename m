Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D3059E7C2
	for <lists+openbmc@lfdr.de>; Tue, 23 Aug 2022 18:43:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MBw6P3CKPz2xrW
	for <lists+openbmc@lfdr.de>; Wed, 24 Aug 2022 02:43:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=qF9khFt2;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::f34; helo=mail-qv1-xf34.google.com; envelope-from=brandonkim@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=qF9khFt2;
	dkim-atps=neutral
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MBw5y1hp3z2xGg
	for <openbmc@lists.ozlabs.org>; Wed, 24 Aug 2022 02:43:32 +1000 (AEST)
Received: by mail-qv1-xf34.google.com with SMTP id q8so10950555qvr.9
        for <openbmc@lists.ozlabs.org>; Tue, 23 Aug 2022 09:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=E4MRtIV9SJl74DZmWJEJRRyhXM8JXsuIKMikOJOxXeA=;
        b=qF9khFt2vlUPpJy3KcukTfqMAJEL6sn55cOX7FJOMTJq1RnEuukafpqJMqThGe0V/9
         U0Sy+v/4iNVDljgtMo0vN/U8Ke626CoG+/MmpM7L8kzjeMrSDRjKEUnoHiE5d7dyCWYw
         uRsGha9Duz32GQrvKUaaDXL2+fFrJv/BVZWp6ezfXG6rl49netwgQxvZDHAdvk/v7OMZ
         NEmWEAdixzNivv2DzGjjOfuT2ec5E4JQR0e8LvOjmqIVpAmzmk31jXFYhDW31tiEplYM
         uA4UDKgFyDXS6mPiXX4IWrpM48PRyO6LB4ZGFe8dWMYJcyQEAf+urleK/kwA2Vq22uAC
         tCtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=E4MRtIV9SJl74DZmWJEJRRyhXM8JXsuIKMikOJOxXeA=;
        b=JQH9XFd0wq5HbthHVAqHB470/tZwvrTku7dW2XCUeGofDG52iHZAm36v9HtlIQ9ehG
         DG+7CAhAeE7lbqDqQ2+AXsUyDEx5ptcyUodJNwlPpaVGTEOygKUgtg2ANeGSOPDySai3
         LfWD+kCdpkjscs04hGwk7lXCPPJhxxVFtUfWKBWRucFcXbGdrrsTLy+ahiGRlEj2I/Xv
         L7UmUBjOsVUuwtEHFCwEya6rmfJKWO+wUvXriQOjpGcIvJrRCP8wXZh/4+fWZJnhT5Ns
         B7mbL2icLvlKFcjaeJnMZ4PpPFpcU2Xcr9bAR7eV3vMz0hDnkdd4Ho0XLw+zD0pB8E4D
         6mpw==
X-Gm-Message-State: ACgBeo38J0nPggvvuv6obTlGy8tP/RZBmLH6b/io4g3qEcf9zh6M4bcD
	cCZpexZR+dodotXgBZlOPcHmwWwzsQJ5+sBylnq19Q==
X-Google-Smtp-Source: AA6agR7cXgWcke5PMg7HMcL9OXkvHLQ1HHP/I3QyVxZ8J4Z/B/e0Y6NVlMgLYrXSAzcPlZ3HDyarvNroBFd20+4DtnM=
X-Received: by 2002:a05:6214:f24:b0:476:72bb:2473 with SMTP id
 iw4-20020a0562140f2400b0047672bb2473mr20841401qvb.82.1661273007627; Tue, 23
 Aug 2022 09:43:27 -0700 (PDT)
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
 <CAAcJOwv4ieTTcYm60M043iXiWiC9=KNK31Pb7jheedqhr84VLg@mail.gmail.com>
 <7528c7d5-0669-1bc8-5b82-39fad3c9f5a8@amperemail.onmicrosoft.com>
 <DM6PR08MB551466928283CBC3B3D6D68DDC6C9@DM6PR08MB5514.namprd08.prod.outlook.com>
 <DM6PR08MB55145B920E9C7A1509BE9BE2DC709@DM6PR08MB5514.namprd08.prod.outlook.com>
In-Reply-To: <DM6PR08MB55145B920E9C7A1509BE9BE2DC709@DM6PR08MB5514.namprd08.prod.outlook.com>
From: Brandon Kim <brandonkim@google.com>
Date: Tue, 23 Aug 2022 09:43:15 -0700
Message-ID: <CALGRKGPX8ehsNHGLkL=N3A=ZmqVf8tD4i1u8niRnHsnGrwgQYg@mail.gmail.com>
Subject: Re: Read smbios2 file failed
To: "Chris Chen (TPI)" <Chris.Chen3@flex.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Jie Yang <jjy@google.com>, openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Chris,

Yes, running the go program you compile and running smbios_transfer
binary as you did, should do what you expect. However, there is a
PACKAGE_CONFIG you will have to append for the ipmi-blob side of
things to work:

Please try building with the following line in your meta layer's
recipes-phosphor/smbios/smbios-mdr_%.bbappend

```
PACKAGECONFIG:append =3D " smbios-ipmi-blob"
```

Cheers,
Brandon


On Tue, Aug 23, 2022 at 12:40 AM Chris Chen (TPI) <Chris.Chen3@flex.com> wr=
ote:
>
> Hi Brandon and Jie,
>
> I would like to send the SMBIOS table from Host to BMC by using "smbios-i=
pmi-blobs" interface. And according to Jie's clue (can send the smbios tabl=
es to BMC either through LinuxBoot or host), and then I saw both of you wer=
e contributing to the "https://github.com/u-root/u-root/blob/main/cmds/exp/=
smbios_transfer/smbios_transfer.go". Therefore, I have some questions about=
 this, could you help to answer them?
>
> I'm assuming that I can build "smbios_transfer" command and execute it on=
 the Host-side (with installed Ubuntu 20.04), am i correct?
>
> In fact, I'm not familiar with u-root and GO language. However, after ref=
erring to some websites to install GO and download u-root, I for now have b=
uilt the cmd out and run it on my Host. Unfortunately, the result looks lik=
e failed.
> =3D=3D=3D
> $ sudo ./smbios_transfer
> 2022/08/23 14:47:14 Transferring SMBIOS tables, attempt 1/2
> 2022/08/23 14:47:34 Error tranferring SMBIOS tables over IPMI: failed to =
write and commit blob /smbios: IPMI BlobWrite /smbios failed: failed to rea=
d rawconn: i/o timeout; IPMI BlobClose /smbios failed: failed to read rawco=
nn: i/o timeout
> 2022/08/23 14:47:34 Transferring SMBIOS tables, attempt 2/2
> 2022/08/23 14:47:54 Error tranferring SMBIOS tables over IPMI: failed to =
write and commit blob /smbios: IPMI BlobWrite /smbios failed: failed to rea=
d rawconn: i/o timeout; IPMI BlobClose /smbios failed: failed to read rawco=
nn: i/o timeout
> =3D=3D=3D
>
> Do you have any suggestions on this error?
>
> ps. I'm sure the IPMI BT interface is workable.
>
> On the BMC-side, I just need to enable smbios-mdr package, correct? or an=
ything else?
>
>
> Thanks.
>
> Regards,
> Chris Chen
>
> ________________________________
> =E5=AF=84=E4=BB=B6=E8=80=85: Chris Chen (TPI) <Chris.Chen3@flex.com>
> =E5=AF=84=E4=BB=B6=E6=97=A5=E6=9C=9F: 2022=E5=B9=B48=E6=9C=8819=E6=97=A5 =
=E4=B8=8B=E5=8D=88 05:50
> =E6=94=B6=E4=BB=B6=E8=80=85: Thang Nguyen <thang@amperemail.onmicrosoft.c=
om>; Jie Yang <jjy@google.com>
> =E5=89=AF=E6=9C=AC: Garrett, Mike (HPE Server Firmware) <mike.garrett@hpe=
.com>; Andrei Kartashev <a.kartashev@yadro.com>; CS20 CHLi30 <chli30@nuvoto=
n.com>; openbmc <openbmc@lists.ozlabs.org>
> =E4=B8=BB=E6=97=A8: =E5=9B=9E=E8=A6=86: Read smbios2 file failed
>
> Hello everyone,
>
> I would like to send the SMBIOS table from Host to BMC by using "smbios-i=
pmi-blobs" interface. But, after reviewing all your discussions, I still ha=
ve no idea how to enable the feature. Could you help to share more details =
with me? for example,
>
> How to generate a raw SMBIOS table with MDRv2 header? (like using "dmidec=
ode --dump-bin" and what else?)
> How do start sending SMBIOS binary file at Host-side? (As I know, the FW =
update mechanism through IPMI blob would need to build a host-tool, named b=
urn-my-bmc, on the Host and then run the tool to start image data transform=
ation. Does the "smbios-ipmi-blobs" with the same method?)
>
>
> p.s. The OS running on the Host is Ubuntu 20.04.
>
> Thanks.
>
> Regards,
> Chris Chen
>
> ________________________________
> =E5=AF=84=E4=BB=B6=E8=80=85: openbmc <openbmc-bounces+chris.chen3=3Dflex.=
com@lists.ozlabs.org> =E4=BB=A3=E8=A1=A8 Thang Nguyen <thang@amperemail.onm=
icrosoft.com>
> =E5=AF=84=E4=BB=B6=E6=97=A5=E6=9C=9F: 2021=E5=B9=B49=E6=9C=8817=E6=97=A5 =
=E4=B8=8B=E5=8D=88 09:40
> =E6=94=B6=E4=BB=B6=E8=80=85: Jie Yang <jjy@google.com>
> =E5=89=AF=E6=9C=AC: Garrett, Mike (HPE Server Firmware) <mike.garrett@hpe=
.com>; Andrei Kartashev <a.kartashev@yadro.com>; CS20 CHLi30 <chli30@nuvoto=
n.com>; openbmc <openbmc@lists.ozlabs.org>
> =E4=B8=BB=E6=97=A8: Re: Read smbios2 file failed
>
>
> Thanks Jia for your information
>
> On 17/09/2021 05:36, Jie Yang wrote:
>
> Hi,
>
> Actually I added an ipmi blob interface to smbios-mdr https://github.com/=
openbmc/smbios-mdr/tree/master/src/smbios-ipmi-blobs. With this interface y=
ou can send the smbios tables to BMC either through LinuxBoot or host. The =
LinuxBoot code https://github.com/u-root/u-root/tree/master/cmds/exp/smbios=
_transfer. Writing and committing to this blob will generate the MDR header=
.
>
> -Jie
>
> On Thu, Sep 16, 2021 at 4:19 AM Thang Nguyen <thang@amperemail.onmicrosof=
t.com> wrote:
>
> Thanks Tim, Mike and Andrei for very useful information. We can make it
> work by adding MDRv2 header.
>
> I am finding some information about the IPMI blobs commands. I can see
> some notes at
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
> > Did you try to use smbios_entry_point or DMI from host to BMC /var/lib/=
smbios/smbios2 for parsing?
> >
> > You can refer this sysfs-firmware-dmi-tables as below:
> >
> > The firmware provides DMI structures as a packed list of data reference=
d by a SMBIOS table entry point.
> > The SMBIOS entry point contains general information, like SMBIOS versio=
n, DMI table size, etc.
> > The structure, content and size of SMBIOS entry point is dependent on S=
MBIOS version.
> >
> > The format of SMBIOS entry point and DMI structures can be read in SMBI=
OS specification.
> > The dmi/tables provides raw SMBIOS entry point and DMI tables through s=
ysfs as an alternative to utilities reading them from /dev/mem.
> >
> > The raw SMBIOS entry point and DMI table are presented as binary attrib=
utes and are accessible via:
> > /sys/firmware/dmi/tables/smbios_entry_point
> > /sys/firmware/dmi/tables/DMI
> >
> > Best regards,
> > Tim
> >
> > -----Original Message-----
> > From: openbmc [mailto:openbmc-bounces+chli30=3Dnuvoton.com@lists.ozlabs=
.org] On Behalf Of Garrett, Mike (HPE Server Firmware)
> > Sent: Wednesday, September 15, 2021 9:19 PM
> > To: Andrei Kartashev <a.kartashev@yadro.com>; Thang Nguyen <thang@amper=
email.onmicrosoft.com>; openbmc <openbmc@lists.ozlabs.org>
> > Subject: RE: Read smbios2 file failed
> >
> > We recently did the same thing and got it working.  All you have to do =
is take the RAW smbios records blob in binary form (delivered as noted belo=
w in whatever way you choose) and prepend a specific header:  https://apc01=
.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2Fopenbmc=
%2Fsmbios-mdr%2Fblob%2F33c948a473bd273fea0cff82d4c99b70b7784be6%2Finclude%2=
Fsmbios_mdrv2.hpp%23L114&amp;data=3D04%7C01%7Cchli30%40nuvoton.com%7C81a4bd=
29e4904bf4d84608d978510b92%7Ca3f24931d4034b4a94f17d83ac638e07%7C0%7C0%7C637=
673526954552742%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjo iV2luMz=
IiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DoQwcozsSoGlgSFwztPFV3FA=
oPpRZGYoZ7pc0%2BxDi1MA%3D&amp;reserved=3D0
> >
> > It is a little bit fragile as it introduces a dependency on the file do=
wnload logic to write a non-standard header defined in another service that=
 could potentially change.
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
> >   The privileged confidential information contained in this email is in=
tended for use only by the addressees as indicated by the original sender o=
f this email. If you are not the addressee indicated in this email or are n=
ot responsible for delivery of the email to such a person, please kindly re=
ply to the sender indicating this fact and delete all copies of it from you=
r computer and network server immediately. Your cooperation is highly appre=
ciated. It is advised that any unauthorized use of confidential information=
 of Nuvoton is strictly prohibited; and any information in this email irrel=
evant to the official business of Nuvoton shall be deemed as neither given =
nor endorsed by Nuvoton.
>
> Legal Disclaimer :
> The information contained in this message may be privileged and confident=
ial.
> It is intended to be read only by the individual or entity to whom it is =
addressed
> or by their designee. If the reader of this message is not the intended r=
ecipient,
> you are on notice that any distribution of this message, in any form,
> is strictly prohibited. If you have received this message in error,
> please immediately notify the sender and delete or destroy any copy of th=
is message!
