Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9AF59FF9D
	for <lists+openbmc@lfdr.de>; Wed, 24 Aug 2022 18:38:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MCWx44wzkz3bc1
	for <lists+openbmc@lfdr.de>; Thu, 25 Aug 2022 02:38:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=CaQgjfBt;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::f2f; helo=mail-qv1-xf2f.google.com; envelope-from=brandonkim@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=CaQgjfBt;
	dkim-atps=neutral
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com [IPv6:2607:f8b0:4864:20::f2f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MCWwf096Zz2xGR
	for <openbmc@lists.ozlabs.org>; Thu, 25 Aug 2022 02:37:36 +1000 (AEST)
Received: by mail-qv1-xf2f.google.com with SMTP id l5so8495333qvs.13
        for <openbmc@lists.ozlabs.org>; Wed, 24 Aug 2022 09:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=HtX9MXu2vzg1om4IRmh3LWmPS5QKhSgr1unUXsLZO3U=;
        b=CaQgjfBtipxWuCSxuS8PjQ2cqBLr5GPynQltWvfEfNXFWGd6HEFKdFrkQLgP2kelQT
         6dMm+jk1PneDDlNo+cFbjw6Bw2GGIGpWJZQmIYLFmPDncbYtmfvTXM/bdT1XrFysTvYg
         lMep1v30PMgV2gMURyIbFNouHda20EJ4Mya5Gr3MuE5fICuSkc3gkaK0NYVYFYPiE5c+
         7vEAi/6O2iRXDh/AYroeJ7X/EzI3RMMFDgdaIegpL593x5rtrWGhtJ5ihbQGPNYk20BE
         j5l+PmqthMceMDpTjd0yp2Ajge/HEAyv+5Jiw0vR0Zgwre8VQ5UDuDQFFqr2f/ePKdE/
         uDsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=HtX9MXu2vzg1om4IRmh3LWmPS5QKhSgr1unUXsLZO3U=;
        b=2q8oNrlAbDpPfJTiu5Ay97yqBRr1FGR4YIM7Y1/RekF/398svqHy8ztdWhZXXn1kpN
         i3yW+yzQ41kLyOzBGhpQkEhVU5X+lbYr7GAacdl93rNp4n6M5tu4SiMoGhg8RaTCr9a9
         QDix+JAzLv7IZwT2H1296SzCkYcBfXwgN5r4XLA7OjVHBq6TUYOrGCzn/UQ+TIbMt43c
         7RZjEKzi3WncyL5s/dm6Qrc6xLmVu763AO0rC/WMRDXE4NEyBwB9WZq27D3129Enxcn3
         qjiXQXTkIzFr2chnlhRzBzNCHDG2z7JklNDMZRIOaGKZ/iiOiP07RrKhQzbf/KMoqviv
         c4Ew==
X-Gm-Message-State: ACgBeo1YGsCxWZN1M//x7Iw1hlg076e8A9l7FgmcZCCA7k76uqnIVFI1
	ktdV/6PWhQv2JlrnmQpekvmjMWhNzm+XjTLJd606Jw==
X-Google-Smtp-Source: AA6agR4D7/p17pTdFvzn9wep+SU6IJYdGJ+FQgXijV0NJVGGfxCYiXTaBxM36POgMjSLyZheBI5m9Yo2UnCryKwwzqc=
X-Received: by 2002:ad4:5ce5:0:b0:496:8901:736f with SMTP id
 iv5-20020ad45ce5000000b004968901736fmr24791897qvb.63.1661359051119; Wed, 24
 Aug 2022 09:37:31 -0700 (PDT)
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
 <CALGRKGPX8ehsNHGLkL=N3A=ZmqVf8tD4i1u8niRnHsnGrwgQYg@mail.gmail.com> <DM6PR08MB5514CF4C8AEE58D295B37DA6DC739@DM6PR08MB5514.namprd08.prod.outlook.com>
In-Reply-To: <DM6PR08MB5514CF4C8AEE58D295B37DA6DC739@DM6PR08MB5514.namprd08.prod.outlook.com>
From: Brandon Kim <brandonkim@google.com>
Date: Wed, 24 Aug 2022 09:37:19 -0700
Message-ID: <CALGRKGO8QtET2HJZGZ0V99F4KxdXX6gZErWrY3FdNPf=LhdnnA@mail.gmail.com>
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

Hi Chris, thanks for adding more debug messages.

We don't see this failure.. I'm guessing we're 100% sure that IPMI is
not an issue here (I think not, since we're able to enumerate the
blobs)? Could you check to see if the open was actually successful and
that it was written with the correct flags?

Could you also ensure you're at the very latest SRCREV of OpenBMC as well?

Thanks,
Brandon

On Wed, Aug 24, 2022 at 2:25 AM Chris Chen (TPI) <Chris.Chen3@flex.com> wro=
te:
>
> Hi Brandon and Jie,
>
>
>
> I think I have added "smbios-ipmi-blob" library and also updated the SRCR=
EV to the latest in the smbios-mdr_git.bbappend file.
>
>
>
> So, I added some debug messages in the "phosphor-ipmi-blobs" and the "u-r=
oot" repos respectively. I figured out one weird thing that is the BMC-side=
 doesn't receive the "bmcBlobWrite" command, and then Host-side gets failed=
 due to no response. Following are the messages I captured, could you help =
to have a look at it and give some clues? Thank you.
>
>
>
> =3D=3D=3D Host-side =3D=3D=3D
>
> $ sudo ./smbios_transfer -num_retries 1
>
> 2022/08/24 16:40:53 Transferring SMBIOS tables, attempt 1/1
>
> 2022/08/24 16:40:53 BlobGetCount
>
> 2022/08/24 16:40:53 ctransferSmbiosData - total blobCount=3D4
>
> 2022/08/24 16:40:53 BlobEnumerate
>
> 2022/08/24 16:40:53 ctransferSmbiosData id=3D/flash/hash
>
> 2022/08/24 16:40:53 BlobEnumerate
>
> 2022/08/24 16:40:53 ctransferSmbiosData id=3D/flash/image
>
> 2022/08/24 16:40:53 BlobEnumerate
>
> 2022/08/24 16:40:53 ctransferSmbiosData id=3D/smbios
>
> 2022/08/24 16:40:53 BlobOpen
>
> 2022/08/24 16:40:53 BlobWrite
>
> 2022/08/24 16:41:03 ReceiveResponse - failed to read rawconn: i/o timeout
>
> 2022/08/24 16:41:03 BlobClose
>
> 2022/08/24 16:41:13 ReceiveResponse - failed to read rawconn: i/o timeout
>
> 2022/08/24 16:41:13 Error tranferring SMBIOS tables over IPMI: failed to =
write and commit blob /smbios: IPMI BlobWrite /smbios failed: failed to rea=
d rawconn: i/o timeout; IPMI BlobClose /smbios failed: failed to read rawco=
nn: i/o timeout
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>
>
> =3D=3D=3D BMC-side =3D=3D=3D
>
> Jan 01 00:00:16 hudsonbay-obmc ipmid[190]: Registering OEM:[0X00C2CF], Cm=
d:[0X80] for Blob Commands
>
> Jan 01 00:00:16 hudsonbay-obmc ipmid[190]: loadLibraries - Enter
>
> Jan 01 00:00:16 hudsonbay-obmc ipmid[190]: loadLibraries dlopen:/usr/lib/=
blob-ipmid/libfirmwareblob.so
>
> Jan 01 00:00:16 hudsonbay-obmc ipmid[190]: config loaded: /flash/image
>
> Jan 01 00:00:16 hudsonbay-obmc ipmid[190]: loadLibraries dlopen:/usr/lib/=
blob-ipmid/libsmbiosstore.so.0
>
> Jan 01 00:00:16 hudsonbay-obmc ipmid[190]: SmbiosBlobHandler - createHand=
ler
>
> Jan 01 00:00:16 hudsonbay-obmc ipmid[190]: loadLibraries dlopen:/usr/lib/=
blob-ipmid/liblogblob.so
>
> Jan 01 00:00:16 hudsonbay-obmc ipmid[190]: loadLibraries dlopen:/usr/lib/=
blob-ipmid/libversionblob.so
>
> Jan 01 00:00:16 hudsonbay-obmc ipmid[190]: loadLibraries dlopen:/usr/lib/=
blob-ipmid/libfirmwarecleanupblob.so
>
> Jan 01 00:00:16 hudsonbay-obmc ipmid[190]: loadLibraries =E2=80=93 Exit
>
> =E2=80=A6
>
> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - Enter
>
> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - cmd num=3D=
0
>
> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: Blob::getBlobCount - Enter
>
> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: SmbiosBlobHandler::getBlobIds =
- blobId=3D/smbios
>
> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: Blob::getBlobCount - Exit
>
> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - Exit
>
>
> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - Enter
>
> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - cmd num=3D=
1
>
> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: BlobManager::getBlobId - ids=
=3D/flash/hash
>
> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - Exit
>
>
> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - Enter
>
> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - cmd num=3D=
1
>
> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: BlobManager::getBlobId - ids=
=3D/flash/image
>
> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - Exit
>
>
> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - Enter
>
> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - cmd num=3D=
1
>
> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: BlobManager::getBlobId - ids=
=3D/smbios
>
> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - Exit
>
>
> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - Enter
>
> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - cmd num=3D=
2
>
> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: Blob::openBlob - Enter
>
> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: openBlob path=3D/smbios
>
> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: SmbiosBlobHandler::open - Ente=
r
>
> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: SmbiosBlobHandler::open - Exit
>
> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: Blob::openBlob - Exit
>
> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - Exit
>
>
> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - Enter
>
> Jan 01 00:08:35 hudsonbay-obmc ipmid[190]: handleBlobCommand - cmd num=3D=
6
>
> Jan 01 00:08:35 hudsonbay-obmc ipmid[190]: Blob::closeBlob - Enter
>
> Jan 01 00:08:35 hudsonbay-obmc ipmid[190]: SmbiosBlobHandler::close - Ent=
er
>
> Jan 01 00:08:35 hudsonbay-obmc ipmid[190]: SmbiosBlobHandler::close - Exi=
t
>
> Jan 01 00:08:35 hudsonbay-obmc ipmid[190]: Blob::closeBlob - Exit
>
> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand (replyLength=
=3D=3D0) - Exit
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>
>
> Regards,
>
> Chris Chen
>
> ________________________________
>
> =E5=AF=84=E4=BB=B6=E8=80=85: Brandon Kim <brandonkim@google.com>
> =E5=AF=84=E4=BB=B6=E6=97=A5=E6=9C=9F: 2022=E5=B9=B48=E6=9C=8824=E6=97=A5 =
=E4=B8=8A=E5=8D=88 12:43
> =E6=94=B6=E4=BB=B6=E8=80=85: Chris Chen (TPI) <Chris.Chen3@flex.com>
> =E5=89=AF=E6=9C=AC: Jie Yang <jjy@google.com>; openbmc <openbmc@lists.ozl=
abs.org>
> =E4=B8=BB=E6=97=A8: Re: Read smbios2 file failed
>
>
>
> !-------------------------------------------------------------------|
>
>   This email was sent from someone outside of Flex. Do not
>   click on any links, reply or open attachments unless you
>   recognize the sender and know the content is safe. If
>   suspicious, report it to spamsample@flex.com.
> |-------------------------------------------------------------------!
>
> Hi Chris,
>
> Yes, running the go program you compile and running smbios_transfer
> binary as you did, should do what you expect. However, there is a
> PACKAGE_CONFIG you will have to append for the ipmi-blob side of
> things to work:
>
> Please try building with the following line in your meta layer's
> recipes-phosphor/smbios/smbios-mdr_%.bbappend
>
> ```
> PACKAGECONFIG:append =3D " smbios-ipmi-blob"
> ```
>
> Cheers,
> Brandon
>
>
> On Tue, Aug 23, 2022 at 12:40 AM Chris Chen (TPI) <Chris.Chen3@flex.com> =
wrote:
> >
> > Hi Brandon and Jie,
> >
> > I would like to send the SMBIOS table from Host to BMC by using "smbios=
-ipmi-blobs" interface. And according to Jie's clue (can send the smbios ta=
bles to BMC either through LinuxBoot or host), and then I saw both of you w=
ere contributing to the "https://urldefense.com/v3/__https://github.com/u-r=
oot/u-root/blob/main/cmds/exp/smbios_transfer/smbios_transfer.go__;!!HSntlC=
g!TV2b4jzad6O_WAZAI1wboTdRw8KbITIWTzC2fn5GNRJ7DifQr1xCsFKxRrh5vW0XmDcRgtYvj=
cRTS55JUTxghw$  ". Therefore, I have some questions about this, could you h=
elp to answer them?
> >
> > I'm assuming that I can build "smbios_transfer" command and execute it =
on the Host-side (with installed Ubuntu 20.04), am i correct?
> >
> > In fact, I'm not familiar with u-root and GO language. However, after r=
eferring to some websites to install GO and download u-root, I for now have=
 built the cmd out and run it on my Host. Unfortunately, the result looks l=
ike failed.
> > =3D=3D=3D
> > $ sudo ./smbios_transfer
> > 2022/08/23 14:47:14 Transferring SMBIOS tables, attempt 1/2
> > 2022/08/23 14:47:34 Error tranferring SMBIOS tables over IPMI: failed t=
o write and commit blob /smbios: IPMI BlobWrite /smbios failed: failed to r=
ead rawconn: i/o timeout; IPMI BlobClose /smbios failed: failed to read raw=
conn: i/o timeout
> > 2022/08/23 14:47:34 Transferring SMBIOS tables, attempt 2/2
> > 2022/08/23 14:47:54 Error tranferring SMBIOS tables over IPMI: failed t=
o write and commit blob /smbios: IPMI BlobWrite /smbios failed: failed to r=
ead rawconn: i/o timeout; IPMI BlobClose /smbios failed: failed to read raw=
conn: i/o timeout
> > =3D=3D=3D
> >
> > Do you have any suggestions on this error?
> >
> > ps. I'm sure the IPMI BT interface is workable.
> >
> > On the BMC-side, I just need to enable smbios-mdr package, correct? or =
anything else?
> >
> >
> > Thanks.
> >
> > Regards,
> > Chris Chen
> >
> > ________________________________
> > =E5=AF=84=E4=BB=B6=E8=80=85: Chris Chen (TPI) <Chris.Chen3@flex.com>
> > =E5=AF=84=E4=BB=B6=E6=97=A5=E6=9C=9F: 2022=E5=B9=B48=E6=9C=8819=E6=97=
=A5 =E4=B8=8B=E5=8D=88 05:50
> > =E6=94=B6=E4=BB=B6=E8=80=85: Thang Nguyen <thang@amperemail.onmicrosoft=
.com>; Jie Yang <jjy@google.com>
> > =E5=89=AF=E6=9C=AC: Garrett, Mike (HPE Server Firmware) <mike.garrett@h=
pe.com>; Andrei Kartashev <a.kartashev@yadro.com>; CS20 CHLi30 <chli30@nuvo=
ton.com>; openbmc <openbmc@lists.ozlabs.org>
> > =E4=B8=BB=E6=97=A8: =E5=9B=9E=E8=A6=86: Read smbios2 file failed
> >
> > Hello everyone,
> >
> > I would like to send the SMBIOS table from Host to BMC by using "smbios=
-ipmi-blobs" interface. But, after reviewing all your discussions, I still =
have no idea how to enable the feature. Could you help to share more detail=
s with me? for example,
> >
> > How to generate a raw SMBIOS table with MDRv2 header? (like using "dmid=
ecode --dump-bin" and what else?)
> > How do start sending SMBIOS binary file at Host-side? (As I know, the F=
W update mechanism through IPMI blob would need to build a host-tool, named=
 burn-my-bmc, on the Host and then run the tool to start image data transfo=
rmation. Does the "smbios-ipmi-blobs" with the same method?)
> >
> >
> > p.s. The OS running on the Host is Ubuntu 20.04.
> >
> > Thanks.
> >
> > Regards,
> > Chris Chen
> >
> > ________________________________
> > =E5=AF=84=E4=BB=B6=E8=80=85: openbmc <openbmc-bounces+chris.chen3=3Dfle=
x.com@lists.ozlabs.org> =E4=BB=A3=E8=A1=A8 Thang Nguyen <thang@amperemail.o=
nmicrosoft.com>
> > =E5=AF=84=E4=BB=B6=E6=97=A5=E6=9C=9F: 2021=E5=B9=B49=E6=9C=8817=E6=97=
=A5 =E4=B8=8B=E5=8D=88 09:40
> > =E6=94=B6=E4=BB=B6=E8=80=85: Jie Yang <jjy@google.com>
> > =E5=89=AF=E6=9C=AC: Garrett, Mike (HPE Server Firmware) <mike.garrett@h=
pe.com>; Andrei Kartashev <a.kartashev@yadro.com>; CS20 CHLi30 <chli30@nuvo=
ton.com>; openbmc <openbmc@lists.ozlabs.org>
> > =E4=B8=BB=E6=97=A8: Re: Read smbios2 file failed
> >
> >
> > Thanks Jia for your information
> >
> > On 17/09/2021 05:36, Jie Yang wrote:
> >
> > Hi,
> >
> > Actually I added an ipmi blob interface to smbios-mdr https://urldefens=
e.com/v3/__https://github.com/openbmc/smbios-mdr/tree/master/src/smbios-ipm=
i-blobs__;!!HSntlCg!TV2b4jzad6O_WAZAI1wboTdRw8KbITIWTzC2fn5GNRJ7DifQr1xCsFK=
xRrh5vW0XmDcRgtYvjcRTS54qpIAumA$  . With this interface you can send the sm=
bios tables to BMC either through LinuxBoot or host. The LinuxBoot code htt=
ps://urldefense.com/v3/__https://github.com/u-root/u-root/tree/master/cmds/=
exp/smbios_transfer__;!!HSntlCg!TV2b4jzad6O_WAZAI1wboTdRw8KbITIWTzC2fn5GNRJ=
7DifQr1xCsFKxRrh5vW0XmDcRgtYvjcRTS54GUWKtiw$  . Writing and committing to t=
his blob will generate the MDR header.
> >
> > -Jie
> >
> > On Thu, Sep 16, 2021 at 4:19 AM Thang Nguyen <thang@amperemail.onmicros=
oft.com> wrote:
> >
> > Thanks Tim, Mike and Andrei for very useful information. We can make it
> > work by adding MDRv2 header.
> >
> > I am finding some information about the IPMI blobs commands. I can see
> > some notes at
> >
> > https://urldefense.com/v3/__https://github.com/openbmc/docs/blob/master=
/designs/binarystore-via-blobs.md__;!!HSntlCg!TV2b4jzad6O_WAZAI1wboTdRw8KbI=
TIWTzC2fn5GNRJ7DifQr1xCsFKxRrh5vW0XmDcRgtYvjcRTS57DJil0FA$
> >
> > https://urldefense.com/v3/__https://github.com/openbmc/phosphor-ipmi-bl=
obs/blob/master/README.md__;!!HSntlCg!TV2b4jzad6O_WAZAI1wboTdRw8KbITIWTzC2f=
n5GNRJ7DifQr1xCsFKxRrh5vW0XmDcRgtYvjcRTS56DlU_SCA$
> >
> > But I have not found more description about the IPMI blob commands like
> > NetFn, Func, ... that I can send a file from Host to BMC. Do you have
> > any information about them?
> >
> >
> > Thanks,
> >
> > Thang Q. Nguyen
> >
> > On 16/09/2021 09:40, CS20 CHLi30 wrote:
> > > Hi Thang,
> > > Did you try to use smbios_entry_point or DMI from host to BMC /var/li=
b/smbios/smbios2 for parsing?
> > >
> > > You can refer this sysfs-firmware-dmi-tables as below:
> > >
> > > The firmware provides DMI structures as a packed list of data referen=
ced by a SMBIOS table entry point.
> > > The SMBIOS entry point contains general information, like SMBIOS vers=
ion, DMI table size, etc.
> > > The structure, content and size of SMBIOS entry point is dependent on=
 SMBIOS version.
> > >
> > > The format of SMBIOS entry point and DMI structures can be read in SM=
BIOS specification.
> > > The dmi/tables provides raw SMBIOS entry point and DMI tables through=
 sysfs as an alternative to utilities reading them from /dev/mem.
> > >
> > > The raw SMBIOS entry point and DMI table are presented as binary attr=
ibutes and are accessible via:
> > > /sys/firmware/dmi/tables/smbios_entry_point
> > > /sys/firmware/dmi/tables/DMI
> > >
> > > Best regards,
> > > Tim
> > >
> > > -----Original Message-----
> > > From: openbmc [mailto:openbmc-bounces+chli30=3Dnuvoton.com@lists.ozla=
bs.org] On Behalf Of Garrett, Mike (HPE Server Firmware)
> > > Sent: Wednesday, September 15, 2021 9:19 PM
> > > To: Andrei Kartashev <a.kartashev@yadro.com>; Thang Nguyen <thang@amp=
eremail.onmicrosoft.com>; openbmc <openbmc@lists.ozlabs.org>
> > > Subject: RE: Read smbios2 file failed
> > >
> > > We recently did the same thing and got it working.  All you have to d=
o is take the RAW smbios records blob in binary form (delivered as noted be=
low in whatever way you choose) and prepend a specific header:  https://url=
defense.com/v3/__https://apc01.safelinks.protection.outlook.com/?url=3Dhttp=
s*3A*2F*2Fgithub.com*2Fopenbmc*2Fsmbios-mdr*2Fblob*2F33c948a473bd273fea0cff=
82d4c99b70b7784be6*2Finclude*2Fsmbios_mdrv2.hpp*23L114&amp;data=3D04*7C01*7=
Cchli30*40nuvoton.com*7C81a4bd29e4904bf4d84608d978510b92*7Ca3f24931d4034b4a=
94f17d83ac638e07*7C0*7C0*7C637673526954552742*7CUnknown*7CTWFpbGZsb3d8eyJWI=
joiMC4wLjAwMDAiLCJQIjo__;JSUlJSUlJSUlJSUlJSUlJSUlJSU!!HSntlCg!TV2b4jzad6O_W=
AZAI1wboTdRw8KbITIWTzC2fn5GNRJ7DifQr1xCsFKxRrh5vW0XmDcRgtYvjcRTS56BTyjjfg$ =
  iV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DoQwcozsSoGlgSF=
wztPFV3FAoPpRZGYoZ7pc0%2BxDi1MA%3D&amp;reserved=3D0
> > >
> > > It is a little bit fragile as it introduces a dependency on the file =
download logic to write a non-standard header defined in another service th=
at could potentially change.
> > >
> > > Mike
> > >
> > >> -----Original Message-----
> > >> From: openbmc <openbmc-
> > >> bounces+mike.garrett=3Dhpe.com@lists.ozlabs.org> On Behalf Of Andrei
> > >> Kartashev
> > >> Sent: Wednesday, September 15, 2021 3:17 AM
> > >> To: Thang Nguyen <thang@amperemail.onmicrosoft.com>; openbmc
> > >> <openbmc@lists.ozlabs.org>
> > >> Subject: Re: Read smbios2 file failed
> > >>
> > >> I don't know what is format of "dmidecode --dump-bin", but if it jus=
t
> > >> raw dump of smbios then you only need to add mdr header.
> > >>
> > >> See answer for the same question here:
> > >> INVALID URI REMOVED
> > >> 021-July/026882.html__;!!NpxR!2w0FkPs2KyaB6XOvB8et52bWKqAMLImmL-
> > >> iUk9A_zZbJ8WLhMeXdvRAp-pcxt8Q$
> > >>
> > >> On Wed, 2021-09-15 at 12:41 +0700, Thang Nguyen wrote:
> > >>> Hi Andrei,
> > >>>
> > >>> I see output of "dmidecode --dump-bin" follows SMBIOS specification=
.
> > >>> As
> > >>> the data for smbios-mdr does not follow this, do you know about the
> > >>> document or any information I can reference to prepare data to send
> > >>> to BMC??
> > >>>
> > >>>
> > >>> Best Regards,
> > >>>
> > >>> Thang Q. Nguyen
> > >>>
> > >>> On 14/09/2021 15:51, Andrei Kartashev wrote:
> > >>>> No, it is not same as "dmidecode --dump-bin".
> > >>>>
> > >>>> On Tue, 2021-09-14 at 13:46 +0700, Thang Nguyen wrote:
> > >>>>> On 13/09/2021 23:56, Andrei Kartashev wrote:
> > >>>>>> You need to somehow deliver smbios data image to BMC. This
> > >>>>>> means, your BIOS should implementat some logic to transfer
> > >>>>>> this data.
> > >>>>>> For BMC side see example here:
> > >>>>>> https://urldefense.com/v3/__https://apc01.safelinks.protection.o=
utlook.com/?url=3Dhttps*3A*2__;JSU!!HSntlCg!TV2b4jzad6O_WAZAI1wboTdRw8KbITI=
WTzC2fn5GNRJ7DifQr1xCsFKxRrh5vW0XmDcRgtYvjcRTS57ySTDXQQ$
> > >>>>>> F%2Fgithub.com%2Fopenbmc%2Fintel-ipmi-&amp;data=3D04%7C01%7Cchli
> > >>>>>> 30%40nuvoton.com%7C81a4bd29e4904bf4d84608d978510b92%7Ca3f24931
> > >>>>>> d4034b4a94f17d83ac638e07%7C0%7C0%7C637673526954552742%7CUnknow
> > >>>>>> n%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik
> > >>>>>> 1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DcG6ZZzOSXkuUtcQuuoymsRdP
> > >>>>>> p24mINa%2FhCy%2BYhe%2FNmk%3D&amp;reserved=3D0
> > >> oem/blob/master/src/smbios
> > >>>>>> mdrv2handler.cpp
> > >>>>> Hi Andrei,
> > >>>>>
> > >>>>> What is the format of smbios data to transfer to BMC? Is it the
> > >>>>> same content of "dmidecode --dump-bin" command from Host Linux?
> > >> or
> > >>>>> anything special in formatting the content to send?
> > >>>>>
> > >>>>>> On Mon, 2021-09-13 at 17:40 +0300, Alexander Raih wrote:
> > >>>>>>> Hi guys, I am beginner in openbmc I build openbmc with
> > >>>>>>> smbios-mdr repository and I have error:
> > >>>>>>>
> > >>>>>>> Read data from flash error - Open MDRV2 table file failure
> > >>>>>>>
> > >>>>>>> There isnt file in /var/lib/smbios/smbios2
> > >>>>>>>
> > >>>>>>> How I can resolve this problem?
> > >>>>>>> Help me please!!!
> > >>
> > >> --
> > >> Best regards,
> > >> Andrei Kartashev
> > >>
> > > ________________________________
> > > ________________________________
> > >   The privileged confidential information contained in this email is =
intended for use only by the addressees as indicated by the original sender=
 of this email. If you are not the addressee indicated in this email or are=
 not responsible for delivery of the email to such a person, please kindly =
reply to the sender indicating this fact and delete all copies of it from y=
our computer and network server immediately. Your cooperation is highly app=
reciated. It is advised that any unauthorized use of confidential informati=
on of Nuvoton is strictly prohibited; and any information in this email irr=
elevant to the official business of Nuvoton shall be deemed as neither give=
n nor endorsed by Nuvoton.
> >
> > Legal Disclaimer :
> > The information contained in this message may be privileged and confide=
ntial.
> > It is intended to be read only by the individual or entity to whom it i=
s addressed
> > or by their designee. If the reader of this message is not the intended=
 recipient,
> > you are on notice that any distribution of this message, in any form,
> > is strictly prohibited. If you have received this message in error,
> > please immediately notify the sender and delete or destroy any copy of =
this message!
