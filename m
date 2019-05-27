Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 727152B008
	for <lists+openbmc@lfdr.de>; Mon, 27 May 2019 10:21:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45C9133hkLzDqKb
	for <lists+openbmc@lfdr.de>; Mon, 27 May 2019 18:21:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (mailfrom) smtp.mailfrom=eltan.com
 (client-ip=213.75.39.7; helo=cpsmtpb-ews04.kpnxchange.com;
 envelope-from=wvervoorn@eltan.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=eltan.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=kpnmail.nl header.i=@kpnmail.nl header.b="SEq6TelT"; 
 dkim-atps=neutral
Received: from cpsmtpb-ews04.kpnxchange.com (cpsmtpb-ews04.kpnxchange.com
 [213.75.39.7])
 by lists.ozlabs.org (Postfix) with ESMTP id 45C90T0CHdzDqHq
 for <openbmc@lists.ozlabs.org>; Mon, 27 May 2019 18:20:53 +1000 (AEST)
Received: from cpsps-ews09.kpnxchange.com ([10.94.84.176]) by
 cpsmtpb-ews04.kpnxchange.com with Microsoft SMTPSVC(7.5.7601.17514); 
 Mon, 27 May 2019 10:20:48 +0200
X-Brand: +YTO/YbK+g==
X-KPN-SpamVerdict: e1=0;e2=0;e3=0;e4=(e4=10;e1=10;e3=10;e2=11);EVW:Whi
 te;BM:NotScanned;FinalVerdict:Clean
X-CMAE-Analysis: v=2.3 cv=V+OsLtvi c=1 sm=1 tr=0 cx=a_idp_e
 a=LO2mTXPAMClkaqVt2RTykg==:117 a=LO2mTXPAMClkaqVt2RTykg==:17
 a=eIHzyqS2sMcA:10 a=kj9zAlcOel0A:10 a=xqWC_Br6kY4A:10
 a=E5NmQfObTbMA:10 a=-c9VzbpeAAAA:8 a=voM4FWlXAAAA:8
 a=F1EsugPcyDucxXN2BocA:9 a=CjuIK1q_8ugA:10 a=WAq88MDkwfy8HpmZFCM0:22
 a=IC2XNlieTeVoXbcui8wp:22
X-CM-AcctID: kpn@feedback.cloudmark.com
Received: from smtp.kpnmail.nl ([195.121.84.12]) by cpsps-ews09.kpnxchange.com
 over TLS secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Mon, 27 May 2019 10:20:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kpnmail.nl; s=kpnmail01;
 h=mime-version:content-type:message-id:date:subject:to:from;
 bh=QYd09B3q+G+yQGlt0oLA55hfoCfkXD3EdbSuYVpG1vk=;
 b=SEq6TelTzxSGJgQF0jbPh5D3b+4/645WrF6uyjPVGCxtJRGGINWQlSVCB7Bsca3IgQ39dvtzw5eQe
 a23n96dDe/zoyB+md1lj4i6/abzPGeQ/vMH0aJAfOiSYYYuEpD2VFOCzUjFZ4O92xp5tdXeXiw/Kvt
 E/ryZtBRlb4bvNMA=
Received: from Eltsrv03.Eltan.local (unknown [84.85.114.86])
 by smtp.kpnmail.nl (Halon) with ESMTPS
 id 55136cff-8058-11e9-96e0-00505699772e;
 Mon, 27 May 2019 10:20:48 +0200 (CEST)
Received: from Eltsrv03.Eltan.local (192.168.100.3) by Eltsrv03.Eltan.local
 (192.168.100.3) with Microsoft SMTP Server (TLS) id 15.0.847.32; Mon, 27 May
 2019 10:19:51 +0200
Received: from Eltsrv03.Eltan.local ([fe80::24e7:1cc6:a76a:a3a8]) by
 Eltsrv03.Eltan.local ([fe80::24e7:1cc6:a76a:a3a8%12]) with mapi id
 15.00.0847.040; Mon, 27 May 2019 10:19:45 +0200
From: Wim Vervoorn <wvervoorn@eltan.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: IKVM on AST2400
Thread-Topic: IKVM on AST2400
Thread-Index: AdUUYodASLBseELfRPSRnFujjQqcUA==
Date: Mon, 27 May 2019 08:19:44 +0000
Message-ID: <d826c4212f9b472ab33bf1036e5a4768@Eltsrv03.Eltan.local>
Accept-Language: nl-NL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.100.108]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginalArrivalTime: 27 May 2019 08:20:48.0577 (UTC)
 FILETIME=[16E6BB10:01D51465]
X-RcptDomain: lists.ozlabs.org
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello Alexander,

We are supporting the AST2400 as well.

I am also wondering what the correct changes are to get iKVM working proper=
ly on the AST2400.

The errors caused by create_usbhid.sh are caused by usb gadget support that=
 isn't enabled. This should be done in the Linux kernel. We are using the f=
ollowing options:

CONFIG_USB_GADGET=3Dy
CONFIG_USB_F_HID=3Dy
CONFIG_USB_GADGET=3Dy
CONFIG_USB_ASPEED_VHUB=3Dy
CONFIG_USB_CONFIGFS=3Dy
CONFIG_USB_CONFIGFS_MASS_STORAGE=3Dy
CONFIG_USB_CONFIGFS_F_HID=3Dy

The CONFIG_USB_CONFIGFS_MASS_STORAGE is not really needed for this. This is=
 only required if you also want to support emulation of a USB storage devic=
e.

Besides this you need a small change to the aspeed-g4.dtsi and the system d=
ts to add the VHUB device. You can copy that from the aspeed-g5.dtsi.

I am wondering which support you enabled for the actual iKVM support to wor=
k and which code you are actually using. (which kernel etc).

As far as I have understood these memory area's are required but I am not r=
eally sure about it.

		gfx_memory: framebuffer {
			size =3D <0x00800000>;
			alignment =3D <0x01000000>;
			compatible =3D "shared-dma-pool";
			reusable;
		};

		video_engine_memory: jpegbuffer {
			size =3D <0x02000000>;	/* 32MM */
			alignment =3D <0x01000000>;
			compatible =3D "shared-dma-pool";
			reusable;
		};

The questions I have are : =20

The "gfx_memory" area seems double to me we also have the "vga_memory" area=
 which also is the video memory, why do we need to define a 2nd one that as=
 far as I understand it points to the same physical part of RAM.=20

I can understand where the "video_engine_memory" is for but it is not clear=
 how I can determine the required size. As the total amount of memory is li=
mited we are trying to reduce memory usage where possible and so far I have=
n't been able to find out what is defining the size of this block of memory=
.

Best regards,

Wim Vervoorn=20






Date: Fri, 24 May 2019 15:03:28 +0300
From: "Alexander A. Filippov" <a.filippov@yadro.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: IKVM on AST2400
Message-ID: <20190524120328.GA648@bbwork.lan>
Content-Type: text/plain; charset=3D"utf-8"

Some time ago the obmc-ikvm service was added to the firmware. It causes so=
me problems on our VESNIN hardware. As it based on AST2400 it does not have=
 support for IKVM in the DTS. The system log contains messages that create_=
usbhid.sh is unable to find some items in the sysfs and then obmc-ikvm serv=
ice crashes. It causes fail in QEMU_CI test.

I belive that this issue also present on other platforms based on AST2400.=
=20

IBM Guys: Do you run tests for Palmetto?=20
Is there anybody else who uses AST2400?

Well, my proposal is to make the IKVM support optional by moving it to the =
distrofeature.

Besides, I've solved these problems for our hardware by adding required ker=
nel modules and modifying DTS.=20
IKVM works, but bring a lot of warnings after the host was shut down while =
the VNC-client is still connected.

During the solving I copied some records from aspeed-g5.dtsi to aspeed-g4.d=
tsi.=20
Should I commit these changes to Torvalds or OpenBMC repo?

--
Regards
Alexander Filippov
Software Engineer, YADRO



