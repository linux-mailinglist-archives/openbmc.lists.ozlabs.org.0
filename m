Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FD1596D0B
	for <lists+openbmc@lfdr.de>; Wed, 17 Aug 2022 12:55:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M74fg0w0Lz3c5G
	for <lists+openbmc@lfdr.de>; Wed, 17 Aug 2022 20:55:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=NYn1Kcnv;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com; envelope-from=a.kartashev@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=NYn1Kcnv;
	dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M74fD1cqVz30hw
	for <openbmc@lists.ozlabs.org>; Wed, 17 Aug 2022 20:54:43 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
	by mta-01.yadro.com (Postfix) with ESMTP id D24EA4357F;
	Wed, 17 Aug 2022 10:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
	user-agent:date:date:mime-version:content-transfer-encoding
	:content-type:content-type:organization:references:in-reply-to
	:from:from:subject:subject:message-id:received:received:received
	:received; s=mta-01; t=1660733676; x=1662548077; bh=A3Tqq48SWOfc
	spsDm4WD54+8RwE+J40RKjYaGzPapm8=; b=NYn1Kcnv4eOnoUpoy6W0KypjZRf9
	uAJ6ewEbQgtEs5MdnIJ6BDyTGJJ8hildz3maPFNC++E7A3Px8Syzt5BFItZSVMf5
	680hvCE/BqQUhPFid72lF3NhAv3BlzcjXf1/vn61A/Lkmus1hS2GZnHDwk0u+TtS
	dw7+vJFUEIfviBM=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
	by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xyy8_dgoGK7M; Wed, 17 Aug 2022 13:54:36 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com [172.17.10.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mta-01.yadro.com (Postfix) with ESMTPS id C6E5C432D8;
	Wed, 17 Aug 2022 13:54:36 +0300 (MSK)
Received: from T-EXCH-09.corp.yadro.com (172.17.11.59) by
 T-EXCH-02.corp.yadro.com (172.17.10.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Wed, 17 Aug 2022 13:54:36 +0300
Received: from [10.199.0.70] (10.199.0.70) by T-EXCH-09.corp.yadro.com
 (172.17.11.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1118.9; Wed, 17 Aug
 2022 13:54:35 +0300
Message-ID: <a985c9e1c388f5e35a0c9c4f6c97794b758a0412.camel@yadro.com>
Subject: Re: Ynt: Ynt: Ynt: (External) Re: Adding Inventory
From: Andrei Kartashev <a.kartashev@yadro.com>
To: =?UTF-8?Q?O=C4=9Fuzhan_=C3=87A=C4=9ELAR?= <oguzhan.caglar@pavotek.com.tr>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
In-Reply-To: <615cc43556cb43b1926482f7a78fc75f@pavotek.com.tr>
References: <6fbe1a4cf05a483b86986e1cdf5f53aa@pavotek.com.tr>
	 ,<794cf20fd781d5a28746800c05b41b866c099483.camel@yadro.com>
	 <dbe33b3b957344ae9efa8c56e4c6a554@pavotek.com.tr>
	 ,<e10b60146c5a120eb615be8a4513f9a9f9a91756.camel@yadro.com>
	 <b46a5098aabb470b8515c16aa1ef9f65@pavotek.com.tr>
	,<fe14142bd0ce01238f87262c107b5c71425c3ab8.camel@yadro.com>
	 <615cc43556cb43b1926482f7a78fc75f@pavotek.com.tr>
Organization: YADRO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Date: Wed, 17 Aug 2022 12:02:39 +0300
User-Agent: Evolution 3.44.2 
X-Originating-IP: [10.199.0.70]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-09.corp.yadro.com (172.17.11.59)
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

On Mon, 2022-08-15 at 12:36 +0000, O=C4=9Fuzhan =C3=87A=C4=9ELAR wrote:
>=20
> Thank you, Andrei,
>=20
> I successfully built it now. Why do I get this error?=C2=A0

cpuinfo is additional daemon, that actually do nothing with smbios, but
it can get some CPU-related information by using PECI interface. For
about couple of years PECI wasn't supported by upstream OpenBMC, the
implementation was only in Intel's fork.
I don't know actual situation, but I guess you just miss some libraries
for PECI support.
Anyway, you don't need this at this stage.

> In addition,=C2=A0I guess I have to dive into BIOS to get information
> about CPU and DIMM. Is it right?=C2=A0

Yes, smbiosmdrv2 daemon reads SMBIOS information from the file
/var/lib/smbios/smbios2 and you have to somehow deliver it to the BMC
filesystem.

> Is there any example to do that?

Not sure. I think I saw somewhere in the Internet example of delivering
it using phosphor-ipmi-blobs.

> What exactly do the smbios-mdr daemon?
>=20

Well, it just parse SMBIOS tables from binary file and expose extracted
information to dbus for other daemons use.

> O=C4=9Fuzhan =C3=87a=C4=9Flar
> Yaz=C4=B1l=C4=B1m M=C3=BChendisi
> =C2=A0
> =C2=A0
> =C2=A0
> Pavo Tasar=C4=B1m =C3=9Cretim Elektronik Tic. A.=C5=9E.
> Teknopark =C4=B0stanbul, Kurtk=C3=B6y Pendik =C4=B0STANBUL
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> Tel=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 : +90 (216) 354 72 86
> Faks=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : +90 (216) 354 76 7=
7
> Gsm=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : +90 (507) 585=
 10 60
> oguzhan.caglar@pavotek.com.tr
> =C2=A0
> www.pavotek.com.tr
>=20
> =C2=A0
> G=C3=B6nderen: Andrei Kartashev <a.kartashev@yadro.com>
> G=C3=B6nderildi: 15 A=C4=9Fustos 2022 Pazartesi 13:23:33
> Kime: O=C4=9Fuzhan =C3=87A=C4=9ELAR; openbmc@lists.ozlabs.org
> Konu: Re: Ynt: Ynt: (External) Re: Adding Inventory
> =C2=A0
>=20
> Warning: This e-mail came from an external source. If you do not
> trust the sender or if there is anything suspicious in the content of
> the e-mail, please inform the IT department.
>=20
>=20
>=20
> As I assumed, it is PCUInfo issue:
>=20
> |
> /home/pavo/oguz/pavoopenbmc/aspeedopenbmc/openbmc/build/epca/tmp/work
> /a
> rm1176jzs-openbmc-linux-gnueabi/smbios-mdr/1.0+gitAUTOINC+e4ea37716d-
> r1/git/src/cpuinfo_main.cpp:407:14: error: 'icxd' was not declared in
> this scope; did you mean 'icx'?
> |=C2=A0=C2=A0 407 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case =
icxd:
> |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~
> |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 icx
> |
> /home/pavo/oguz/pavoopenbmc/aspeedopenbmc/openbmc/build/epca/tmp/work
> /a
> rm1176jzs-openbmc-linux-gnueabi/smbios-mdr/1.0+gitAUTOINC+e4ea37716d-
> r1/git/src/cpuinfo_main.cpp:408:14: error: 'spr' was not declared in
> this scope
> |=C2=A0=C2=A0 408 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case =
spr:
> |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~
>=20
>=20
> Turn it off in you bbappend with `PACKAGECONFIG:remove =3D " cpuinfo"`
>=20
>=20
>=20
> On Mon, 2022-08-15 at 07:25 +0000, O=C4=9Fuzhan =C3=87A=C4=9ELAR wrote:
> >=20
> > I'm sharing with you that my yocto errors are related to smbios-
> > mdr in the .txt file.
> >=20
> > I don't understand, How can the CPU information match with entity-
> > manager configuration files? I saw your comment in openbmc list
> > about
> > PCIe. It probes only with xyz.openbmc_project.FruDevice.
> >=20
> >=20
> > O=C4=9Fuzhan =C3=87a=C4=9Flar
> > Software Design Engineer
> >=20
> >=20
> >=20
> > Pavo Tasar=C4=B1m =C3=9Cretim Elektronik Tic. A.=C5=9E.
> > Teknopark =C4=B0stanbul, Kurtk=C3=B6y Pendik =C4=B0STANBUL
> >=20
> >=20
> > Tel=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 : +90 (216) 354 72 86
> > Faks=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : +90 (216) 354 76=
 77
> > Gsm=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : +90 (507) 5=
85 10 60
> > oguzhan.caglar@pavotek.com.tr
> >=20
> > www.pavotek.com.tr
> >=20
> >=20
> > G=C3=B6nderen: Andrei Kartashev <a.kartashev@yadro.com>
> > G=C3=B6nderildi: 12 A=C4=9Fustos 2022 Cuma 22:14:38
> > Kime: O=C4=9Fuzhan =C3=87A=C4=9ELAR; openbmc@lists.ozlabs.org
> > Konu: Re: Ynt: (External) Re: Adding Inventory
> >=20
> >=20
> > Warning: This e-mail came from an external source. If you do not
> > trust the sender or if there is anything suspicious in the content
> > of
> > the e-mail, please inform the IT department.
> >=20
> >=20
> >=20
> > I have no idea on what do you mean saying "added the CPU and DIMM
> > configuration files within the .yaml files", but I guess you are
> > trying
> > to hardcode this information, which I believe not what ou actually
> > expect to get.
> > You probably should learn how the OpenBMC works inside. You can use
> > busctl tool for that.
> >=20
> > Regarding compilation error of smbios-mdr daemon, I can say nothing
> > without knowing the issue. There should not be any special
> > configuration files for this smbios-mdr recipe but probably you
> > trying
> > to build CPUInfo part of the recipe without having PECI library.
> > You
> > likely should disable cpuinfo app.
> >=20
> > On Fri, 2022-08-12 at 06:50 +0000, O=C4=9Fuzhan =C3=87A=C4=9ELAR wrote:
> > > Hi Andrei,
> > >=20
> > > Thank you for your information. I have already added the CPU and
> > > DIMM
> > > configuration files within the .yaml files. When I added these
> > > files(related to the path: xyz.openbmc_project.Inventory.Item.Cpu
> > > and xyz.openbmc_project.Inventory.Item.Dimm), I see the CPU and
> > > DIMM
> > > entries over WebUI. However, In this way, I add the properties
> > > such
> > > as (PartNumber, SerialNumber, etc.) on my own. I have already
> > > generated a .bin file that has FRU information (chassis, board
> > > etc.)
> > > and I included this in BMC's image file. In addition, I see the
> > > properties related to Chassis, Board on WebUI.
> > >=20
> > > I have already checked the smbios-mdr daemon in openbmc. However,
> > > when I include this daemon in my yocto image, the bitbake shows
> > > some
> > > errors that are related to smbios-mdr's .cpp files. I guess I
> > > have
> > > to
> > > create some configuration files before doing it. Is it wrong?
> > > What
> > > should I do?
> > >=20
> > > I guess I have to need some code in BIOS. Is there any example to
> > > do
> > > this? I don't know where I should start.
> > >=20
> > > Thank you.
> > >=20
> > > O=C4=9Fuzhan =C3=87a=C4=9Flar
> > > Software Design Engineer
> > >=20
> > >=20
> > >=20
> > > Pavo Tasar=C4=B1m =C3=9Cretim Elektronik Tic. A.=C5=9E.
> > > Teknopark =C4=B0stanbul, Kurtk=C3=B6y Pendik =C4=B0STANBUL
> > >=20
> > >=20
> > > Tel=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 : +90 (216) 354 72 86
> > > Faks=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : +90 (216) 354 =
76 77
> > > Gsm=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : +90 (507)=
 585 10 60
> > > oguzhan.caglar@pavotek.com.tr
> > >=20
> > > www.pavotek.com.tr
> > >=20
> > >=20
> > > G=C3=B6nderen: Andrei Kartashev <a.kartashev@yadro.com>
> > > G=C3=B6nderildi: 11 A=C4=9Fustos 2022 Per=C5=9Fembe 22:28:16
> > > Kime: O=C4=9Fuzhan =C3=87A=C4=9ELAR; openbmc@lists.ozlabs.org
> > > Konu: (External) Re: Adding Inventory
> > >=20
> > >=20
> > > Warning: This e-mail came from an external source. If you do not
> > > trust the sender or if there is anything suspicious in the
> > > content
> > > of
> > > the e-mail, please inform the IT department.
> > >=20
> > >=20
> > >=20
> > > Hello Oguzhan,
> > >=20
> > > This is a very common question for newcomers, I believe is was
> > > already
> > > answered somewhere in the list.
> > > BMC out of the box don't have any knowledge on host's equipment
> > > (CPU,
> > > DIMM, Drive, AIC, etc) - it is up to you to deliver this
> > > information
> > > from host to BMC. As for now the most common way to feed BMC the
> > > information regarding CPU and DIMM is to transfer smbios tables
> > > via
> > > ipmi. You can implement any other mechanism but any way, you need
> > > to
> > > have some code in your BIOS.
> > >=20
> > > As soon as you have the CPU/DIMM information on BMC it can be
> > > shown
> > > in
> > > bmcweb by implementing corresponding dbus interfaces
> > > (xyz.openbmc_project.Inventory.Item.Cpu and
> > > xyz.openbmc_project.Inventory.Item.Dimm). smbiosmdrv2 daemon do
> > > this,
> > > but you also can add EntityManager configuration files for this
> > > or
> > > write your own daemon to expose the interfaces.
> > >=20
> > > On Thu, 2022-08-04 at 08:07 +0000, O=C4=9Fuzhan =C3=87A=C4=9ELAR wrot=
e:
> > > > Hello,
> > > >=20
> > > > I'm working on openbmc for ast2500 bmc. I want to add inventory
> > > > such
> > > > as CPU and DIMM etc. I added the chassis from .json file but I
> > > > couldn't add the CPU and DIMM. I know this is to related with
> > > > entity-
> > > > manager. How can I add these inventory on WEBUI? Can you give
> > > > some
> > > > information about this issue?
> > > >=20
> > > > Regards.
> > > >=20
> > > > O=C4=9Fuzhan =C3=87a=C4=9Flar
> > > > Software Design Engineer
> > > >=20
> > > >=20
> > > >=20
> > > > Pavo Tasar=C4=B1m =C3=9Cretim Elektronik Tic. A.=C5=9E.
> > > > Teknopark =C4=B0stanbul, Kurtk=C3=B6y Pendik =C4=B0STANBUL
> > > >=20
> > > >=20
> > > > Tel=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 : +90 (216) 354 72 86
> > > > Faks=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : +90 (216) 35=
4 76 77
> > > > Gsm=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : +90 (50=
7) 585 10 60
> > > > oguzhan.caglar@pavotek.com.tr
> > > >=20
> > > > www.pavotek.com.tr
> > > >=20
> > > >=20
> > >=20
> > > --
> > > Best regards,
> > > Andrei Kartashev,
> > > Lead BMC Developer
> > >=20
> >=20
> > --
> > Best regards,
> > Andrei Kartashev,
> > Lead BMC Developer
> >=20
>=20
> --
> Best regards,
> Andrei Kartashev,
> Lead BMC Developer
>=20

--=20
Best regards,
Andrei Kartashev,
Lead BMC Developer

