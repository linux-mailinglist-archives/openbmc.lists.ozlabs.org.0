Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 118325A53A5
	for <lists+openbmc@lfdr.de>; Mon, 29 Aug 2022 19:57:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MGdSY6cJcz3bkx
	for <lists+openbmc@lfdr.de>; Tue, 30 Aug 2022 03:57:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=csfPyrj1;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::f29; helo=mail-qv1-xf29.google.com; envelope-from=brandonkim@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=csfPyrj1;
	dkim-atps=neutral
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MGdS71S8cz3bNj
	for <openbmc@lists.ozlabs.org>; Tue, 30 Aug 2022 03:57:09 +1000 (AEST)
Received: by mail-qv1-xf29.google.com with SMTP id j1so6880900qvv.8
        for <openbmc@lists.ozlabs.org>; Mon, 29 Aug 2022 10:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=HOlopScyrp8qLnWAcJ1Uow+bjmOLsVQgrAlQzgHF8cs=;
        b=csfPyrj1/UAuhyRkd3PyYvGC9Lxn7VwxrZhKQXp8PRSaJL1qMrvkFBf+lmoVCZ+ROI
         qbm/iOiO64aImM4br+EE1SgMjerNhZaIlDBuj6+Z4ZVJzkdEfncw3UIU2qU6KG35sbFK
         zNWTzRayqrjpCawXTuCqZKCXgM0pRCCQRvgQb7micLo0q7rSD5hubOgRAexrGZIFKNgJ
         IP+wLQrU+U7FsYyx4znq9QZqK4iV7XZ9wirz6q4apyCVOLt13N1O4F2Wwl/AsiUm+any
         ohHQLQ2yJym1vX2WwjPeKDL4hoDSM3PH1b3k5QGp4T1Rh1skbIWiu6EaJJB7HQ0gxh3O
         OgzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=HOlopScyrp8qLnWAcJ1Uow+bjmOLsVQgrAlQzgHF8cs=;
        b=0CQjGX6vYnrSp35flBJtFcFExMeICxF1Ll+axcI9R0zTcww7Eq2+05gxQvaiYecIk+
         taairKEOkJnsFezBAbTo0Dq++ne3Qs241+j8Y6AefEIsC7lq/m6x9iew+DpllVIQPO5c
         z9/vJ/Efp30DXG/zRMrQo83tWinVm839YkXxUm0U1UzVvj4/duamn5vwnsPXc0Z0cnrY
         sOEeswCezBz9WRzuDqZai09VrbmVqRD/ct2WRDJwc9Z8Fnpuu0i4F55lWs3jnHK3OK/N
         docsMysT1BIHj01bdauoWqL1S9U2q4AMmptFYZXxASV2LsKIx9LnFWf8AJmWqiG+0qWt
         Y0nA==
X-Gm-Message-State: ACgBeo2mpV4BjBU/uqYSvSXNTGe61Dk52tmNKKUnWsBjvuFUhn4tmwwJ
	oQ+AWWXsB2FCMK3S7oHHCgzx7GFcoKhb9y8GCU5ak53VAfY=
X-Google-Smtp-Source: AA6agR4T7h9FZainHquC3ivLfecKdY4eVClYMIAZM5eOpnXmTiIvWFjnrBF4aqwQ82kZ9sB5asJGBxQt5pV1Io1HMrc=
X-Received: by 2002:a05:6214:27ed:b0:497:87d:e876 with SMTP id
 jt13-20020a05621427ed00b00497087de876mr11566541qvb.121.1661795824804; Mon, 29
 Aug 2022 10:57:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAMqwjCAaHrv0SgA_1hDEjjnX1fur6ijmCJCrn1gTPbr5Z2-ONw@mail.gmail.com>
 <d93fc722-2a24-0921-56ee-b9968edbd6a6@amperemail.onmicrosoft.com>
 <4bda1bb5f09395003c95c645518f34828105b160.camel@yadro.com>
 <DF4PR8401MB06341BDD6521896375C0CF498FDB9@DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM>
 <HK0PR03MB5090C26890DAF0FBB36D883CCFDC9@HK0PR03MB5090.apcprd03.prod.outlook.com>
 <9f4b694e-bfc8-59d7-dec4-5ee8f762c4f5@amperemail.onmicrosoft.com>
 <CAAcJOwv4ieTTcYm60M043iXiWiC9=KNK31Pb7jheedqhr84VLg@mail.gmail.com>
 <7528c7d5-0669-1bc8-5b82-39fad3c9f5a8@amperemail.onmicrosoft.com>
 <DM6PR08MB551466928283CBC3B3D6D68DDC6C9@DM6PR08MB5514.namprd08.prod.outlook.com>
 <DM6PR08MB55145B920E9C7A1509BE9BE2DC709@DM6PR08MB5514.namprd08.prod.outlook.com>
 <CALGRKGPX8ehsNHGLkL=N3A=ZmqVf8tD4i1u8niRnHsnGrwgQYg@mail.gmail.com>
 <DM6PR08MB5514CF4C8AEE58D295B37DA6DC739@DM6PR08MB5514.namprd08.prod.outlook.com>
 <CALGRKGO8QtET2HJZGZ0V99F4KxdXX6gZErWrY3FdNPf=LhdnnA@mail.gmail.com> <705b683f-00e5-8d3e-0a9a-8598351d43ac@amperemail.onmicrosoft.com>
In-Reply-To: <705b683f-00e5-8d3e-0a9a-8598351d43ac@amperemail.onmicrosoft.com>
From: Brandon Kim <brandonkim@google.com>
Date: Mon, 29 Aug 2022 10:56:54 -0700
Message-ID: <CALGRKGPZjJY=KNJexGfpfhs_bo=GQe9b4kRvvsZCiAYUa6XXdw@mail.gmail.com>
Subject: Re: Read smbios2 file failed
To: "Thang Q. Nguyen" <thang@amperemail.onmicrosoft.com>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Thang,

Because we use IPMI blob - it's not so easy to list out all the raw
IPMI commands, but it's certainly doable. However, the smbios_transfer
code is the easiest way (and "should" work) to send all the correct
IPMI commands. Are you also facing similar issues?

Thanks,
Brandon


On Sun, Aug 28, 2022 at 8:52 PM Thang Q. Nguyen
<thang@amperemail.onmicrosoft.com> wrote:
>
> Hi,
>
> Instead of using  smbios_transfer in u-root, what is the IPMI raw
> command to send blob data to BMC?
>
>
> Thanks,
>
> Thang Q. Nguyen
>
> On 24/08/2022 23:37, Brandon Kim wrote:
> > Hi Chris, thanks for adding more debug messages.
> >
> > We don't see this failure.. I'm guessing we're 100% sure that IPMI is
> > not an issue here (I think not, since we're able to enumerate the
> > blobs)? Could you check to see if the open was actually successful and
> > that it was written with the correct flags?
> >
> > Could you also ensure you're at the very latest SRCREV of OpenBMC as we=
ll?
> >
> > Thanks,
> > Brandon
> >
> > On Wed, Aug 24, 2022 at 2:25 AM Chris Chen (TPI) <Chris.Chen3@flex.com>=
 wrote:
> >> Hi Brandon and Jie,
> >>
> >>
> >>
> >> I think I have added "smbios-ipmi-blob" library and also updated the S=
RCREV to the latest in the smbios-mdr_git.bbappend file.
> >>
> >>
> >>
> >> So, I added some debug messages in the "phosphor-ipmi-blobs" and the "=
u-root" repos respectively. I figured out one weird thing that is the BMC-s=
ide doesn't receive the "bmcBlobWrite" command, and then Host-side gets fai=
led due to no response. Following are the messages I captured, could you he=
lp to have a look at it and give some clues? Thank you.
> >>
> >>
> >>
> >> =3D=3D=3D Host-side =3D=3D=3D
> >>
> >> $ sudo ./smbios_transfer -num_retries 1
> >>
> >> 2022/08/24 16:40:53 Transferring SMBIOS tables, attempt 1/1
> >>
> >> 2022/08/24 16:40:53 BlobGetCount
> >>
> >> 2022/08/24 16:40:53 ctransferSmbiosData - total blobCount=3D4
> >>
> >> 2022/08/24 16:40:53 BlobEnumerate
> >>
> >> 2022/08/24 16:40:53 ctransferSmbiosData id=3D/flash/hash
> >>
> >> 2022/08/24 16:40:53 BlobEnumerate
> >>
> >> 2022/08/24 16:40:53 ctransferSmbiosData id=3D/flash/image
> >>
> >> 2022/08/24 16:40:53 BlobEnumerate
> >>
> >> 2022/08/24 16:40:53 ctransferSmbiosData id=3D/smbios
> >>
> >> 2022/08/24 16:40:53 BlobOpen
> >>
> >> 2022/08/24 16:40:53 BlobWrite
> >>
> >> 2022/08/24 16:41:03 ReceiveResponse - failed to read rawconn: i/o time=
out
> >>
> >> 2022/08/24 16:41:03 BlobClose
> >>
> >> 2022/08/24 16:41:13 ReceiveResponse - failed to read rawconn: i/o time=
out
> >>
> >> 2022/08/24 16:41:13 Error tranferring SMBIOS tables over IPMI: failed =
to write and commit blob /smbios: IPMI BlobWrite /smbios failed: failed to =
read rawconn: i/o timeout; IPMI BlobClose /smbios failed: failed to read ra=
wconn: i/o timeout
> >>
> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>
> >>
> >>
> >> =3D=3D=3D BMC-side =3D=3D=3D
> >>
> >> Jan 01 00:00:16 hudsonbay-obmc ipmid[190]: Registering OEM:[0X00C2CF],=
 Cmd:[0X80] for Blob Commands
> >>
> >> Jan 01 00:00:16 hudsonbay-obmc ipmid[190]: loadLibraries - Enter
> >>
> >> Jan 01 00:00:16 hudsonbay-obmc ipmid[190]: loadLibraries dlopen:/usr/l=
ib/blob-ipmid/libfirmwareblob.so
> >>
> >> Jan 01 00:00:16 hudsonbay-obmc ipmid[190]: config loaded: /flash/image
> >>
> >> Jan 01 00:00:16 hudsonbay-obmc ipmid[190]: loadLibraries dlopen:/usr/l=
ib/blob-ipmid/libsmbiosstore.so.0
> >>
> >> Jan 01 00:00:16 hudsonbay-obmc ipmid[190]: SmbiosBlobHandler - createH=
andler
> >>
> >> Jan 01 00:00:16 hudsonbay-obmc ipmid[190]: loadLibraries dlopen:/usr/l=
ib/blob-ipmid/liblogblob.so
> >>
> >> Jan 01 00:00:16 hudsonbay-obmc ipmid[190]: loadLibraries dlopen:/usr/l=
ib/blob-ipmid/libversionblob.so
> >>
> >> Jan 01 00:00:16 hudsonbay-obmc ipmid[190]: loadLibraries dlopen:/usr/l=
ib/blob-ipmid/libfirmwarecleanupblob.so
> >>
> >> Jan 01 00:00:16 hudsonbay-obmc ipmid[190]: loadLibraries =E2=80=93 Exi=
t
> >>
> >> =E2=80=A6
> >>
> >> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - Enter
> >>
> >> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - cmd num=
=3D0
> >>
> >> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: Blob::getBlobCount - Enter
> >>
> >> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: SmbiosBlobHandler::getBlobI=
ds - blobId=3D/smbios
> >>
> >> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: Blob::getBlobCount - Exit
> >>
> >> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - Exit
> >>
> >>
> >> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - Enter
> >>
> >> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - cmd num=
=3D1
> >>
> >> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: BlobManager::getBlobId - id=
s=3D/flash/hash
> >>
> >> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - Exit
> >>
> >>
> >> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - Enter
> >>
> >> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - cmd num=
=3D1
> >>
> >> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: BlobManager::getBlobId - id=
s=3D/flash/image
> >>
> >> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - Exit
> >>
> >>
> >> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - Enter
> >>
> >> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - cmd num=
=3D1
> >>
> >> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: BlobManager::getBlobId - id=
s=3D/smbios
> >>
> >> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - Exit
> >>
> >>
> >> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - Enter
> >>
> >> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - cmd num=
=3D2
> >>
> >> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: Blob::openBlob - Enter
> >>
> >> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: openBlob path=3D/smbios
> >>
> >> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: SmbiosBlobHandler::open - E=
nter
> >>
> >> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: SmbiosBlobHandler::open - E=
xit
> >>
> >> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: Blob::openBlob - Exit
> >>
> >> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - Exit
> >>
> >>
> >> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - Enter
> >>
> >> Jan 01 00:08:35 hudsonbay-obmc ipmid[190]: handleBlobCommand - cmd num=
=3D6
> >>
> >> Jan 01 00:08:35 hudsonbay-obmc ipmid[190]: Blob::closeBlob - Enter
> >>
> >> Jan 01 00:08:35 hudsonbay-obmc ipmid[190]: SmbiosBlobHandler::close - =
Enter
> >>
> >> Jan 01 00:08:35 hudsonbay-obmc ipmid[190]: SmbiosBlobHandler::close - =
Exit
> >>
> >> Jan 01 00:08:35 hudsonbay-obmc ipmid[190]: Blob::closeBlob - Exit
> >>
> >> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand (replyLen=
gth=3D=3D0) - Exit
> >>
> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>
> >>
> >>
> >> Regards,
> >>
> >> Chris Chen
> >>
> >> ________________________________
> >>
> >> =E5=AF=84=E4=BB=B6=E8=80=85: Brandon Kim <brandonkim@google.com>
> >> =E5=AF=84=E4=BB=B6=E6=97=A5=E6=9C=9F: 2022=E5=B9=B48=E6=9C=8824=E6=97=
=A5 =E4=B8=8A=E5=8D=88 12:43
> >> =E6=94=B6=E4=BB=B6=E8=80=85: Chris Chen (TPI) <Chris.Chen3@flex.com>
> >> =E5=89=AF=E6=9C=AC: Jie Yang <jjy@google.com>; openbmc <openbmc@lists.=
ozlabs.org>
> >> =E4=B8=BB=E6=97=A8: Re: Read smbios2 file failed
> >>
> >>
> >>
> >> !-------------------------------------------------------------------|
> >>
> >>    This email was sent from someone outside of Flex. Do not
> >>    click on any links, reply or open attachments unless you
> >>    recognize the sender and know the content is safe. If
> >>    suspicious, report it to spamsample@flex.com.
> >> |-------------------------------------------------------------------!
> >>
> >> Hi Chris,
> >>
> >> Yes, running the go program you compile and running smbios_transfer
> >> binary as you did, should do what you expect. However, there is a
> >> PACKAGE_CONFIG you will have to append for the ipmi-blob side of
> >> things to work:
> >>
> >> Please try building with the following line in your meta layer's
> >> recipes-phosphor/smbios/smbios-mdr_%.bbappend
> >>
> >> ```
> >> PACKAGECONFIG:append =3D " smbios-ipmi-blob"
> >> ```
> >>
> >> Cheers,
> >> Brandon
> >>
> >>
> >> On Tue, Aug 23, 2022 at 12:40 AM Chris Chen (TPI) <Chris.Chen3@flex.co=
m> wrote:
> >>> Hi Brandon and Jie,
> >>>
> >>> I would like to send the SMBIOS table from Host to BMC by using "smbi=
os-ipmi-blobs" interface. And according to Jie's clue (can send the smbios =
tables to BMC either through LinuxBoot or host), and then I saw both of you=
 were contributing to the "https://urldefense.com/v3/__https://github.com/u=
-root/u-root/blob/main/cmds/exp/smbios_transfer/smbios_transfer.go__;!!HSnt=
lCg!TV2b4jzad6O_WAZAI1wboTdRw8KbITIWTzC2fn5GNRJ7DifQr1xCsFKxRrh5vW0XmDcRgtY=
vjcRTS55JUTxghw$  ". Therefore, I have some questions about this, could you=
 help to answer them?
> >>>
> >>> I'm assuming that I can build "smbios_transfer" command and execute i=
t on the Host-side (with installed Ubuntu 20.04), am i correct?
> >>>
> >>> In fact, I'm not familiar with u-root and GO language. However, after=
 referring to some websites to install GO and download u-root, I for now ha=
ve built the cmd out and run it on my Host. Unfortunately, the result looks=
 like failed.
> >>> =3D=3D=3D
> >>> $ sudo ./smbios_transfer
> >>> 2022/08/23 14:47:14 Transferring SMBIOS tables, attempt 1/2
> >>> 2022/08/23 14:47:34 Error tranferring SMBIOS tables over IPMI: failed=
 to write and commit blob /smbios: IPMI BlobWrite /smbios failed: failed to=
 read rawconn: i/o timeout; IPMI BlobClose /smbios failed: failed to read r=
awconn: i/o timeout
> >>> 2022/08/23 14:47:34 Transferring SMBIOS tables, attempt 2/2
> >>> 2022/08/23 14:47:54 Error tranferring SMBIOS tables over IPMI: failed=
 to write and commit blob /smbios: IPMI BlobWrite /smbios failed: failed to=
 read rawconn: i/o timeout; IPMI BlobClose /smbios failed: failed to read r=
awconn: i/o timeout
> >>> =3D=3D=3D
> >>>
> >>> Do you have any suggestions on this error?
> >>>
> >>> ps. I'm sure the IPMI BT interface is workable.
> >>>
> >>> On the BMC-side, I just need to enable smbios-mdr package, correct? o=
r anything else?
> >>>
> >>>
> >>> Thanks.
> >>>
> >>> Regards,
> >>> Chris Chen
> >>>
> >>> ________________________________
> >>> =E5=AF=84=E4=BB=B6=E8=80=85: Chris Chen (TPI) <Chris.Chen3@flex.com>
> >>> =E5=AF=84=E4=BB=B6=E6=97=A5=E6=9C=9F: 2022=E5=B9=B48=E6=9C=8819=E6=97=
=A5 =E4=B8=8B=E5=8D=88 05:50
> >>> =E6=94=B6=E4=BB=B6=E8=80=85: Thang Nguyen <thang@amperemail.onmicroso=
ft.com>; Jie Yang <jjy@google.com>
> >>> =E5=89=AF=E6=9C=AC: Garrett, Mike (HPE Server Firmware) <mike.garrett=
@hpe.com>; Andrei Kartashev <a.kartashev@yadro.com>; CS20 CHLi30 <chli30@nu=
voton.com>; openbmc <openbmc@lists.ozlabs.org>
> >>> =E4=B8=BB=E6=97=A8: =E5=9B=9E=E8=A6=86: Read smbios2 file failed
> >>>
> >>> Hello everyone,
> >>>
> >>> I would like to send the SMBIOS table from Host to BMC by using "smbi=
os-ipmi-blobs" interface. But, after reviewing all your discussions, I stil=
l have no idea how to enable the feature. Could you help to share more deta=
ils with me? for example,
> >>>
> >>> How to generate a raw SMBIOS table with MDRv2 header? (like using "dm=
idecode --dump-bin" and what else?)
> >>> How do start sending SMBIOS binary file at Host-side? (As I know, the=
 FW update mechanism through IPMI blob would need to build a host-tool, nam=
ed burn-my-bmc, on the Host and then run the tool to start image data trans=
formation. Does the "smbios-ipmi-blobs" with the same method?)
> >>>
> >>>
> >>> p.s. The OS running on the Host is Ubuntu 20.04.
> >>>
> >>> Thanks.
> >>>
> >>> Regards,
> >>> Chris Chen
> >>>
> >>> ________________________________
> >>> =E5=AF=84=E4=BB=B6=E8=80=85: openbmc <openbmc-bounces+chris.chen3=3Df=
lex.com@lists.ozlabs.org> =E4=BB=A3=E8=A1=A8 Thang Nguyen <thang@amperemail=
.onmicrosoft.com>
> >>> =E5=AF=84=E4=BB=B6=E6=97=A5=E6=9C=9F: 2021=E5=B9=B49=E6=9C=8817=E6=97=
=A5 =E4=B8=8B=E5=8D=88 09:40
> >>> =E6=94=B6=E4=BB=B6=E8=80=85: Jie Yang <jjy@google.com>
> >>> =E5=89=AF=E6=9C=AC: Garrett, Mike (HPE Server Firmware) <mike.garrett=
@hpe.com>; Andrei Kartashev <a.kartashev@yadro.com>; CS20 CHLi30 <chli30@nu=
voton.com>; openbmc <openbmc@lists.ozlabs.org>
> >>> =E4=B8=BB=E6=97=A8: Re: Read smbios2 file failed
> >>>
> >>>
> >>> Thanks Jia for your information
> >>>
> >>> On 17/09/2021 05:36, Jie Yang wrote:
> >>>
> >>> Hi,
> >>>
> >>> Actually I added an ipmi blob interface to smbios-mdr https://urldefe=
nse.com/v3/__https://github.com/openbmc/smbios-mdr/tree/master/src/smbios-i=
pmi-blobs__;!!HSntlCg!TV2b4jzad6O_WAZAI1wboTdRw8KbITIWTzC2fn5GNRJ7DifQr1xCs=
FKxRrh5vW0XmDcRgtYvjcRTS54qpIAumA$  . With this interface you can send the =
smbios tables to BMC either through LinuxBoot or host. The LinuxBoot code h=
ttps://urldefense.com/v3/__https://github.com/u-root/u-root/tree/master/cmd=
s/exp/smbios_transfer__;!!HSntlCg!TV2b4jzad6O_WAZAI1wboTdRw8KbITIWTzC2fn5GN=
RJ7DifQr1xCsFKxRrh5vW0XmDcRgtYvjcRTS54GUWKtiw$  . Writing and committing to=
 this blob will generate the MDR header.
> >>>
> >>> -Jie
> >>>
> >>> On Thu, Sep 16, 2021 at 4:19 AM Thang Nguyen <thang@amperemail.onmicr=
osoft.com> wrote:
> >>>
> >>> Thanks Tim, Mike and Andrei for very useful information. We can make =
it
> >>> work by adding MDRv2 header.
> >>>
> >>> I am finding some information about the IPMI blobs commands. I can se=
e
> >>> some notes at
> >>>
> >>> https://urldefense.com/v3/__https://github.com/openbmc/docs/blob/mast=
er/designs/binarystore-via-blobs.md__;!!HSntlCg!TV2b4jzad6O_WAZAI1wboTdRw8K=
bITIWTzC2fn5GNRJ7DifQr1xCsFKxRrh5vW0XmDcRgtYvjcRTS57DJil0FA$
> >>>
> >>> https://urldefense.com/v3/__https://github.com/openbmc/phosphor-ipmi-=
blobs/blob/master/README.md__;!!HSntlCg!TV2b4jzad6O_WAZAI1wboTdRw8KbITIWTzC=
2fn5GNRJ7DifQr1xCsFKxRrh5vW0XmDcRgtYvjcRTS56DlU_SCA$
> >>>
> >>> But I have not found more description about the IPMI blob commands li=
ke
> >>> NetFn, Func, ... that I can send a file from Host to BMC. Do you have
> >>> any information about them?
> >>>
> >>>
> >>> Thanks,
> >>>
> >>> Thang Q. Nguyen
> >>>
> >>> On 16/09/2021 09:40, CS20 CHLi30 wrote:
> >>>> Hi Thang,
> >>>> Did you try to use smbios_entry_point or DMI from host to BMC /var/l=
ib/smbios/smbios2 for parsing?
> >>>>
> >>>> You can refer this sysfs-firmware-dmi-tables as below:
> >>>>
> >>>> The firmware provides DMI structures as a packed list of data refere=
nced by a SMBIOS table entry point.
> >>>> The SMBIOS entry point contains general information, like SMBIOS ver=
sion, DMI table size, etc.
> >>>> The structure, content and size of SMBIOS entry point is dependent o=
n SMBIOS version.
> >>>>
> >>>> The format of SMBIOS entry point and DMI structures can be read in S=
MBIOS specification.
> >>>> The dmi/tables provides raw SMBIOS entry point and DMI tables throug=
h sysfs as an alternative to utilities reading them from /dev/mem.
> >>>>
> >>>> The raw SMBIOS entry point and DMI table are presented as binary att=
ributes and are accessible via:
> >>>> /sys/firmware/dmi/tables/smbios_entry_point
> >>>> /sys/firmware/dmi/tables/DMI
> >>>>
> >>>> Best regards,
> >>>> Tim
> >>>>
> >>>> -----Original Message-----
> >>>> From: openbmc [mailto:openbmc-bounces+chli30=3Dnuvoton.com@lists.ozl=
abs.org] On Behalf Of Garrett, Mike (HPE Server Firmware)
> >>>> Sent: Wednesday, September 15, 2021 9:19 PM
> >>>> To: Andrei Kartashev <a.kartashev@yadro.com>; Thang Nguyen <thang@am=
peremail.onmicrosoft.com>; openbmc <openbmc@lists.ozlabs.org>
> >>>> Subject: RE: Read smbios2 file failed
> >>>>
> >>>> We recently did the same thing and got it working.  All you have to =
do is take the RAW smbios records blob in binary form (delivered as noted b=
elow in whatever way you choose) and prepend a specific header:  https://ur=
ldefense.com/v3/__https://apc01.safelinks.protection.outlook.com/?url=3Dhtt=
ps*3A*2F*2Fgithub.com*2Fopenbmc*2Fsmbios-mdr*2Fblob*2F33c948a473bd273fea0cf=
f82d4c99b70b7784be6*2Finclude*2Fsmbios_mdrv2.hpp*23L114&amp;data=3D04*7C01*=
7Cchli30*40nuvoton.com*7C81a4bd29e4904bf4d84608d978510b92*7Ca3f24931d4034b4=
a94f17d83ac638e07*7C0*7C0*7C637673526954552742*7CUnknown*7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjo__;JSUlJSUlJSUlJSUlJSUlJSUlJSU!!HSntlCg!TV2b4jzad6O_=
WAZAI1wboTdRw8KbITIWTzC2fn5GNRJ7DifQr1xCsFKxRrh5vW0XmDcRgtYvjcRTS56BTyjjfg$=
   iV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DoQwcozsSoGlgS=
FwztPFV3FAoPpRZGYoZ7pc0%2BxDi1MA%3D&amp;reserved=3D0
> >>>>
> >>>> It is a little bit fragile as it introduces a dependency on the file=
 download logic to write a non-standard header defined in another service t=
hat could potentially change.
> >>>>
> >>>> Mike
> >>>>
> >>>>> -----Original Message-----
> >>>>> From: openbmc <openbmc-
> >>>>> bounces+mike.garrett=3Dhpe.com@lists.ozlabs.org> On Behalf Of Andre=
i
> >>>>> Kartashev
> >>>>> Sent: Wednesday, September 15, 2021 3:17 AM
> >>>>> To: Thang Nguyen <thang@amperemail.onmicrosoft.com>; openbmc
> >>>>> <openbmc@lists.ozlabs.org>
> >>>>> Subject: Re: Read smbios2 file failed
> >>>>>
> >>>>> I don't know what is format of "dmidecode --dump-bin", but if it ju=
st
> >>>>> raw dump of smbios then you only need to add mdr header.
> >>>>>
> >>>>> See answer for the same question here:
> >>>>> INVALID URI REMOVED
> >>>>> 021-July/026882.html__;!!NpxR!2w0FkPs2KyaB6XOvB8et52bWKqAMLImmL-
> >>>>> iUk9A_zZbJ8WLhMeXdvRAp-pcxt8Q$
> >>>>>
> >>>>> On Wed, 2021-09-15 at 12:41 +0700, Thang Nguyen wrote:
> >>>>>> Hi Andrei,
> >>>>>>
> >>>>>> I see output of "dmidecode --dump-bin" follows SMBIOS specificatio=
n.
> >>>>>> As
> >>>>>> the data for smbios-mdr does not follow this, do you know about th=
e
> >>>>>> document or any information I can reference to prepare data to sen=
d
> >>>>>> to BMC??
> >>>>>>
> >>>>>>
> >>>>>> Best Regards,
> >>>>>>
> >>>>>> Thang Q. Nguyen
> >>>>>>
> >>>>>> On 14/09/2021 15:51, Andrei Kartashev wrote:
> >>>>>>> No, it is not same as "dmidecode --dump-bin".
> >>>>>>>
> >>>>>>> On Tue, 2021-09-14 at 13:46 +0700, Thang Nguyen wrote:
> >>>>>>>> On 13/09/2021 23:56, Andrei Kartashev wrote:
> >>>>>>>>> You need to somehow deliver smbios data image to BMC. This
> >>>>>>>>> means, your BIOS should implementat some logic to transfer
> >>>>>>>>> this data.
> >>>>>>>>> For BMC side see example here:
> >>>>>>>>> https://urldefense.com/v3/__https://apc01.safelinks.protection.=
outlook.com/?url=3Dhttps*3A*2__;JSU!!HSntlCg!TV2b4jzad6O_WAZAI1wboTdRw8KbIT=
IWTzC2fn5GNRJ7DifQr1xCsFKxRrh5vW0XmDcRgtYvjcRTS57ySTDXQQ$
> >>>>>>>>> F%2Fgithub.com%2Fopenbmc%2Fintel-ipmi-&amp;data=3D04%7C01%7Cchl=
i
> >>>>>>>>> 30%40nuvoton.com%7C81a4bd29e4904bf4d84608d978510b92%7Ca3f24931
> >>>>>>>>> d4034b4a94f17d83ac638e07%7C0%7C0%7C637673526954552742%7CUnknow
> >>>>>>>>> n%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik
> >>>>>>>>> 1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DcG6ZZzOSXkuUtcQuuoymsRd=
P
> >>>>>>>>> p24mINa%2FhCy%2BYhe%2FNmk%3D&amp;reserved=3D0
> >>>>> oem/blob/master/src/smbios
> >>>>>>>>> mdrv2handler.cpp
> >>>>>>>> Hi Andrei,
> >>>>>>>>
> >>>>>>>> What is the format of smbios data to transfer to BMC? Is it the
> >>>>>>>> same content of "dmidecode --dump-bin" command from Host Linux?
> >>>>> or
> >>>>>>>> anything special in formatting the content to send?
> >>>>>>>>
> >>>>>>>>> On Mon, 2021-09-13 at 17:40 +0300, Alexander Raih wrote:
> >>>>>>>>>> Hi guys, I am beginner in openbmc I build openbmc with
> >>>>>>>>>> smbios-mdr repository and I have error:
> >>>>>>>>>>
> >>>>>>>>>> Read data from flash error - Open MDRV2 table file failure
> >>>>>>>>>>
> >>>>>>>>>> There isnt file in /var/lib/smbios/smbios2
> >>>>>>>>>>
> >>>>>>>>>> How I can resolve this problem?
> >>>>>>>>>> Help me please!!!
> >>>>> --
> >>>>> Best regards,
> >>>>> Andrei Kartashev
> >>>>>
> >>>> ________________________________
> >>>> ________________________________
> >>>>    The privileged confidential information contained in this email i=
s intended for use only by the addressees as indicated by the original send=
er of this email. If you are not the addressee indicated in this email or a=
re not responsible for delivery of the email to such a person, please kindl=
y reply to the sender indicating this fact and delete all copies of it from=
 your computer and network server immediately. Your cooperation is highly a=
ppreciated. It is advised that any unauthorized use of confidential informa=
tion of Nuvoton is strictly prohibited; and any information in this email i=
rrelevant to the official business of Nuvoton shall be deemed as neither gi=
ven nor endorsed by Nuvoton.
> >>> Legal Disclaimer :
> >>> The information contained in this message may be privileged and confi=
dential.
> >>> It is intended to be read only by the individual or entity to whom it=
 is addressed
> >>> or by their designee. If the reader of this message is not the intend=
ed recipient,
> >>> you are on notice that any distribution of this message, in any form,
> >>> is strictly prohibited. If you have received this message in error,
> >>> please immediately notify the sender and delete or destroy any copy o=
f this message!
