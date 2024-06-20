Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32080910A1E
	for <lists+openbmc@lfdr.de>; Thu, 20 Jun 2024 17:40:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-04 header.b=h/WDvJAp;
	dkim=pass (2048-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-03 header.b=OvKEXNWX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W4l6p6DlQz3cXV
	for <lists+openbmc@lfdr.de>; Fri, 21 Jun 2024 01:40:02 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-04 header.b=h/WDvJAp;
	dkim=pass (2048-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-03 header.b=OvKEXNWX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=yadro.com (client-ip=89.207.88.253; helo=mta-03.yadro.com; envelope-from=a.filippov@yadro.com; receiver=lists.ozlabs.org)
Received: from mta-03.yadro.com (mta-03.yadro.com [89.207.88.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W4l6D3D2gz30VS
	for <openbmc@lists.ozlabs.org>; Fri, 21 Jun 2024 01:39:29 +1000 (AEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-03.yadro.com 87316E0002
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-04;
	t=1718897965; bh=c8FFTGi+eJHKx1EY7pHIFFjymZcqk6RDK29HK4bzWek=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:From;
	b=h/WDvJApOFrqsfioKkdUooURBBuSJUTrbHKeNW4R+QEV3gI7HS+1T+wj4Bn99qao8
	 kQpqaYLhY2wFroEezKmoIXVcKzKEJEN32cVbM0ZjCn2qaeAJXMhqtrGfeO5QqxqYKm
	 rwTqs6P6KuN1h+TxZPalYCM7lTq4aVx6L3LavqGDmyppXQEgJv9ec7eL6zSfC/+4bV
	 MVfCLmnrczPKOPan5wgdk5QBWb01xY2oSUs3OGr3S8CMfjcqx6iMcWptkH70TLuXaC
	 qA4wgAJNJcuEJFMaBabwLx0hSky1IzsvXt9xxhXminTEQfXxYUqPLS3VxQOENprf4F
	 CV7h4d3LghlXw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-03;
	t=1718897965; bh=c8FFTGi+eJHKx1EY7pHIFFjymZcqk6RDK29HK4bzWek=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:From;
	b=OvKEXNWXiEP9PMOzipXGLoOMsDS6/1n0Uvm1opmBLIiAz97E6VsJrUUhLHD60nC61
	 tAzi4kVYLQHnt5a+/1vk46RbEzgQWHeb8dqR9s6IF0z8yhRiYw8jNCFmMBWjYoFPBH
	 JvDp18y5t5iR90KOu9bI+qLmnXx2Iprx9ivM9JLzxbOKF8l05j4h64skFIhwFvpzha
	 /4n1etktYktF5qjn1NGVtpH6NrL/jEkaHLbVOh6DAxPRX3+aTpc/2oNTm74emkeaJP
	 dCKupzAMCaq8Rms7I+sxhtQM/uIYKjbH1G0d94xd/Z6cb0EWFQrqEDmm90IRM8PUkG
	 mE94INoHmjCQA==
Date: Thu, 20 Jun 2024 18:39:24 +0300
From: "Alexander A. Filippov" <a.filippov@yadro.com>
To: Bala Subramaniyan <Bala.Subramaniyan@ltts.com>
Subject: Re: Help with IPMB (IPMI over I2C).
Message-ID: <ZnRNLKeblSrD92n3@nbwork.lan>
References: <MA1PR01MB4308AF26A122B17FCC91768C80C82@MA1PR01MB4308.INDPRD01.PROD.OUTLOOK.COM>
 <ZnQiNlMOYE0ATrKK@nbwork.lan>
 <MA1PR01MB4308550B7CF6199FE4E5433A80C82@MA1PR01MB4308.INDPRD01.PROD.OUTLOOK.COM>
 <MA1PR01MB43082375F4F0563E9E6AB23080C82@MA1PR01MB4308.INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <MA1PR01MB43082375F4F0563E9E6AB23080C82@MA1PR01MB4308.INDPRD01.PROD.OUTLOOK.COM>
X-ClientProxiedBy: T-Exch-05.corp.yadro.com (172.17.10.109) To
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
Cc: Thangaraj S <Thangaraj.S@ltts.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "Alexander A. Filippov" <a.filippov@yadro.com>, Lalit Kumar <Lalit.Kumar2@ltts.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Jun 20, 2024 at 01:29:18PM +0000, Bala Subramaniyan wrote:
> Hi Alexander,
>=20
> Thanks for your reply,
>=20
> ipmitool has raw and i2c commands.
>=20
> Commands:
>         raw           Send a RAW IPMI request and print response
>         i2c           Send an I2C Master Write-Read command and print res=
ponse
>         spd           Print SPD info from remote I2C device
>         lan           Configure LAN Channels
>=20
>=20
> As, I can see ipmi_rawi2c_main() function under ipmitool/lib/ipmi_raw.c<h=
ttps://github.com/openbmc/ipmitool/blob/master/lib/ipmi_raw.c> which is han=
dling I2C Master Read-Write functionality.
>=20
> Can you please guide us on this, Whether we can use this to perform BMC-t=
o-BMC communication.
>=20
> Below is the error i'm getting while performing BMC-to-BMC Master-Slave R=
ead-Write by connecting two i2c buses between the boards.
> root@ast2600-default:~# ipmitool i2c bus=3D14 0x12 0x00 0x00 0x00 0x31 0x=
32 0x33 0x34
> ipmi_master_write_read: rsp_value:6207408, LineNo:104
> I2C Master Write-Read command failed: Invalid command
> ipmi_rawi2c_main: rsp_value:0, LineNo:264
> Unable to perform I2C Master Write-Read
>=20


This command doesn't define a transport for the IPMI command. It asks a rem=
ote
system to write specified bytes and read an answer via i2c bus on that remo=
te
system. And ipmitool uses the default interface (or specified one via `-I`
option) for this command.

As I understood Your first message, You are looking for a transport interfa=
ce
working via i2c, and I don't know the such implementations.

It should be something that You can specify via `-I` option of ipmitool.
By default ipmitool in OpenBMC uses `dbus` as the transport.


> Thanks, and regards,
> Bala Subramaniyan M,
>=20
>=20
>=20
>=20
> [cid:8c0f8170-e1d0-4031-a57d-20b6a72ccf58]<https://www.ltts.com/>
>=20
>=20
> S1 Building, L&T Tech Park, Bellary Road,
>=20
> Next to Raintree Boulevard, Park View Layout,
>=20
> Byatarayanapura, Bengaluru-560092
>=20
> Mobile: +91 9677035467
>=20
> ENGINEERING THE CHANGE | www.LTTS.com<https://www.ltts.com/>
>=20
>=20
>=20
> ________________________________
> From: Bala Subramaniyan <Bala.Subramaniyan@Ltts.com>
> Sent: Thursday, June 20, 2024 6:55 PM
> To: Alexander A. Filippov <a.filippov@yadro.com>
> Cc: openbmc@lists.ozlabs.org <openbmc@lists.ozlabs.org>; Thangaraj S <Tha=
ngaraj.S@Ltts.com>; Lalit Kumar <Lalit.Kumar2@ltts.com>
> Subject: Re: Help with IPMB (IPMI over I2C).
>=20
> Hi Alexander,
>=20
> Thanks for your reply,
>=20
> ipmitool has raw and i2c commands, Please refer below image.
>=20
> [cid:87b5aef4-9628-47c7-b7d4-b714b7a92869]
>=20
> As, I can see ipmi_rawi2c_main() function under ipmitool/lib/ipmi_raw.c<h=
ttps://github.com/openbmc/ipmitool/blob/master/lib/ipmi_raw.c> which is han=
dling I2C Master Read-Write functionality.
>=20
> Can you please guide us on this, Whether we can use this to perform BMC-t=
o-BMC communication.
>=20
> Below is the error i'm getting while performing BMC-to-BMC Master-Slave R=
ead-Write by connecting two i2c buses between the boards.
> root@ast2600-default:~# ipmitool i2c bus=3D14 0x12 0x00 0x00 0x00 0x31 0x=
32 0x33 0x34
> ipmi_master_write_read: rsp_value:6207408, LineNo:104
> I2C Master Write-Read command failed: Invalid command
> ipmi_rawi2c_main: rsp_value:0, LineNo:264
> Unable to perform I2C Master Write-Read
>=20
>=20
> Thanks, and regards,
> Bala Subramaniyan M,
>=20
>=20
>=20
> [cid:08db76b7-f643-4b96-8acd-5325e19c1e99]<https://www.ltts.com/>
>=20
>=20
> S1 Building, L&T Tech Park, Bellary Road,
>=20
> Next to Raintree Boulevard, Park View Layout,
>=20
> Byatarayanapura, Bengaluru-560092
>=20
> Mobile: +91 9677035467
>=20
> ENGINEERING THE CHANGE | www.LTTS.com<https://www.ltts.com/>
>=20
>=20
>=20
> ________________________________
> From: Alexander A. Filippov <a.filippov@yadro.com>
> Sent: Thursday, June 20, 2024 6:06 PM
> To: Bala Subramaniyan <Bala.Subramaniyan@Ltts.com>
> Cc: openbmc@lists.ozlabs.org <openbmc@lists.ozlabs.org>; Thangaraj S <Tha=
ngaraj.S@Ltts.com>; Lalit Kumar <Lalit.Kumar2@ltts.com>
> Subject: Re: Help with IPMB (IPMI over I2C).
>=20
> CAUTION: This email is from an external source. Please do not open attach=
ments or click links from an unknown or suspicious origin. Phishing attempt=
s can be reported by using the report message button in Outlook or sending =
them as an attachment to phishing@Ltts.com. Thank you
>=20
> On Thu, Jun 20, 2024 at 10:43:59AM +0000, Bala Subramaniyan wrote:
> > Hi All,
>=20
> Hi,
>=20
> >
> > For one of our requirement (BMC to BMC, IPMI over I2C), We're exploring=
 with IPMITOOL<https://ind01.safelinks.protection.outlook.com/?url=3Dhttps%=
3A%2F%2Fgithub.com%2Fopenbmc%2Fipmitool&data=3D05%7C02%7CBala.Subramaniyan%=
40ltts.com%7Ccc4bd8ff67674469a56408dc9125913a%7C311b33788e8a4b5ea33fe80a3d8=
ba60a%7C0%7C0%7C638544837919310123%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAw=
MDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C60000%7C%7C%7C&sdata=
=3DxV3gj1uMoigTrD9EV%2FzSYWUCrQG9KBqM8RMHAfkbjL4%3D&reserved=3D0<https://gi=
thub.com/openbmc/ipmitool>>.
> >
> > Development Board: ASPEED AST2600 EVB
> >
> > Could you please suggest us how to proceed further with our below requi=
rement.
> >
> >   1.
> > BMC to BMC (IPMI over I2C), One BMC as Master and other as slave.
> >   2.
> > Send/Receive IPMI commands through IPMITOOL<https://ind01.safelinks.pro=
tection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2Fopenbmc%2Fipmitool&da=
ta=3D05%7C02%7CBala.Subramaniyan%40ltts.com%7Ccc4bd8ff67674469a56408dc91259=
13a%7C311b33788e8a4b5ea33fe80a3d8ba60a%7C0%7C0%7C638544837919318108%7CUnkno=
wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVC=
I6Mn0%3D%7C60000%7C%7C%7C&sdata=3D2Ofk6FFhvtt9DE2Ku6l9E%2Bogf4rDoAnKLJ8IaKC=
AvnA%3D&reserved=3D0<https://github.com/openbmc/ipmitool>> from one BMC to =
other.
> >   3.
> > Send/Receive SDR, SEL logs between two BMC's.
> >
> > Any help would be highly appreciated.
> >
> >
>=20
> As I can see, ipmitool has no any interfaces using i2c directly and I nev=
er
> listen about using i2c as the ipmi transport.
>=20
> Google shows me that the similar question already exists and answered:
>   https://ind01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit=
hub.com%2Fipmitool%2Fipmitool%2Fdiscussions%2F296&data=3D05%7C02%7CBala.Sub=
ramaniyan%40ltts.com%7Ccc4bd8ff67674469a56408dc9125913a%7C311b33788e8a4b5ea=
33fe80a3d8ba60a%7C0%7C0%7C638544837919323925%7CUnknown%7CTWFpbGZsb3d8eyJWIj=
oiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C60000%7C%7C%=
7C&sdata=3DCAO3AlVSwGz7qeFnakA69orWVnat2mADwtIrvMsLtX4%3D&reserved=3D0<http=
s://github.com/ipmitool/ipmitool/discussions/296>
>=20
> As an alternative, You could use lan/lanplus interfaces to communicate wi=
th
> remote BMC via ethernet.
>=20
>=20
> >
> > Thanks, and regards,
> > Bala Subramaniyan M,
> >
> >
> >
> > [cid:59c4f387-285c-4c0f-ada0-09714ca611a9]<https://ind01.safelinks.prot=
ection.outlook.com/?url=3Dhttps%3A%2F%2Fwww.ltts.com%2F&data=3D05%7C02%7CBa=
la.Subramaniyan%40ltts.com%7Ccc4bd8ff67674469a56408dc9125913a%7C311b33788e8=
a4b5ea33fe80a3d8ba60a%7C0%7C0%7C638544837919328258%7CUnknown%7CTWFpbGZsb3d8=
eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C60000%=
7C%7C%7C&sdata=3DUSGH2E9jlgxi8PFwnWtNVmkyHbhtghu94%2BdpEsvGors%3D&reserved=
=3D0>
> >
> >
> > S1 Building, L&T Tech Park, Bellary Road,
> >
> > Next to Raintree Boulevard, Park View Layout,
> >
> > Byatarayanapura, Bengaluru-560092
> >
> > Mobile: +91 9677035467
> >
> > ENGINEERING THE CHANGE | https://ind01.safelinks.protection.outlook.com=
/?url=3Dhttp%3A%2F%2Fwww.ltts.com%2F&data=3D05%7C02%7CBala.Subramaniyan%40l=
tts.com%7Ccc4bd8ff67674469a56408dc9125913a%7C311b33788e8a4b5ea33fe80a3d8ba6=
0a%7C0%7C0%7C638544837919332294%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDA=
iLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C60000%7C%7C%7C&sdata=3D9U=
v9AWzo8JPFstuhNWEwB15fAnmslAUHG3jXjdavo2U%3D&reserved=3D0<https://ind01.saf=
elinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww.ltts.com%2F&data=3D0=
5%7C02%7CBala.Subramaniyan%40ltts.com%7Ccc4bd8ff67674469a56408dc9125913a%7C=
311b33788e8a4b5ea33fe80a3d8ba60a%7C0%7C0%7C638544837919336367%7CUnknown%7CT=
WFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%=
3D%7C60000%7C%7C%7C&sdata=3DKpop%2FwYjGgXiYRbB%2B8xGf%2FdUsbl4ZLp8Hl1YuomzM=
30%3D&reserved=3D0><http://www.ltts.com/>
> >
> >
> >
> > [Ltts.com]
> >
> > L&T Technology Services Ltd
> >
> > https://ind01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fwww.=
ltts.com%2F&data=3D05%7C02%7CBala.Subramaniyan%40ltts.com%7Ccc4bd8ff6767446=
9a56408dc9125913a%7C311b33788e8a4b5ea33fe80a3d8ba60a%7C0%7C0%7C638544837919=
340087%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6=
Ik1haWwiLCJXVCI6Mn0%3D%7C60000%7C%7C%7C&sdata=3Dc46N5pRUVu%2BehD5RAcs3WXkEC=
AobFoEhSCy0LZzqItA%3D&reserved=3D0<http://www.ltts.com/>
> >
> > L&T Technology Services Limited (LTTS) is committed to safeguard your p=
rivacy. Read the appropriate privacy notice<https://ind01.safelinks.protect=
ion.outlook.com/?url=3Dhttps%3A%2F%2Fwww.ltts.com%2Fprivacy-policies-notice=
s&data=3D05%7C02%7CBala.Subramaniyan%40ltts.com%7Ccc4bd8ff67674469a56408dc9=
125913a%7C311b33788e8a4b5ea33fe80a3d8ba60a%7C0%7C0%7C638544837919344116%7CU=
nknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLC=
JXVCI6Mn0%3D%7C60000%7C%7C%7C&sdata=3DBwUKKDaLa%2BfTW2xoVVWwnWXnj11QQ3EPqVf=
cj3Y175A%3D&reserved=3D0<https://www.ltts.com/privacy-policies-notices>> ap=
plicable to you to know more about how LTTS collects, uses and stores your =
personal data. Please visit our privacy policy<https://ind01.safelinks.prot=
ection.outlook.com/?url=3Dhttps%3A%2F%2Fwww.ltts.com%2Fdata-privacy-policy&=
data=3D05%7C02%7CBala.Subramaniyan%40ltts.com%7Ccc4bd8ff67674469a56408dc912=
5913a%7C311b33788e8a4b5ea33fe80a3d8ba60a%7C0%7C0%7C638544837919348226%7CUnk=
nown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJX=
VCI6Mn0%3D%7C60000%7C%7C%7C&sdata=3DWUa8W%2BHcu%2FaFmtd23zvWkveaKXnSUpz6%2F=
a7yf%2FqhpbE%3D&reserved=3D0<https://www.ltts.com/data-privacy-policy>> ava=
ilable on our website https://ind01.safelinks.protection.outlook.com/?url=
=3Dhttp%3A%2F%2Fwww.ltts.com%2F&data=3D05%7C02%7CBala.Subramaniyan%40ltts.c=
om%7Ccc4bd8ff67674469a56408dc9125913a%7C311b33788e8a4b5ea33fe80a3d8ba60a%7C=
0%7C0%7C638544837919352183%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQ=
IjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C60000%7C%7C%7C&sdata=3Dua8rLzm=
y8kkc2ePqG5xBoT8F7aEv8dnC4%2B7EcIFeTFk%3D&reserved=3D0<http://www.ltts.com/=
> for more information about our commitment towards data privacy under appl=
icable data protection laws. This email may contain confidential or privile=
ged information for the intended recipient(s). If you are not the intended =
recipient, please do not use or disseminate the information, notify the sen=
der and delete it from your system.

--
Regads,
Alexander Filippov
