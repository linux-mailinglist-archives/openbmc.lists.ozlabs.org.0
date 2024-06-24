Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB699144E9
	for <lists+openbmc@lfdr.de>; Mon, 24 Jun 2024 10:32:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-04 header.b=vcI7UJ2I;
	dkim=pass (2048-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-03 header.b=zk/gu9q0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W71S81fn0z3cXk
	for <lists+openbmc@lfdr.de>; Mon, 24 Jun 2024 18:32:56 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-04 header.b=vcI7UJ2I;
	dkim=pass (2048-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-03 header.b=zk/gu9q0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=yadro.com (client-ip=89.207.88.248; helo=mta-04.yadro.com; envelope-from=a.filippov@yadro.com; receiver=lists.ozlabs.org)
Received: from mta-04.yadro.com (mta-04.yadro.com [89.207.88.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W71RX2HWYz30V0
	for <openbmc@lists.ozlabs.org>; Mon, 24 Jun 2024 18:32:21 +1000 (AEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-04.yadro.com B4B01C000F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-04;
	t=1719217933; bh=9voJ2Tpa4EoWoPWzp9QnPOt65fSPgIXWROzJnQtUvZo=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:From;
	b=vcI7UJ2IJqtuBrfy3Zv3ibUZSIP6I4oDvCaJJmd+xZWTxpAUocMqI21NvkdipH791
	 gpePHSYrFwXiysjXXMc8gll9miMZIdavQH4OBbl+D7W8Ry8gN9Z9GP7nPKbM3uIcI2
	 FMhDmnDQ3acz2RbYdTZxqPaOlq2rkc74FvI/T7NfANfkL7ZLUiLAUz2hKgz7ebtY6g
	 xTBofDw4D3MvFPnC3hILPB1zQemSpx+SXoID4BJyeXrfWAjqP4gHdv3SOd3jui1iNc
	 L4NSQ1S68A2fEKCj6ZG6ShGfFQn610HWNwhNHuE9+FaSKvB7mIqQ1BIzuJvd1wenTG
	 mat+jMS4ckiXw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-03;
	t=1719217933; bh=9voJ2Tpa4EoWoPWzp9QnPOt65fSPgIXWROzJnQtUvZo=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:From;
	b=zk/gu9q03BcZJLtczhcULz5u/xI5GwXBnYYiNSoe3VjdVCb81xtpWtO1WbJ6j46qh
	 4Wq9AE0izNTUe8wThZnToFsKLqinC+czjf7E6eGb+9Wn1RSFxOHgvMtkQbol9epsTM
	 jxwT+yDXoPC+IOFrHDtODN9uWKh27Eihc5zFMsom99TdZSRfja0F/UkY8xFWxCUmYx
	 9oCLEE4ubRus1B9PEP7E5mkpWLtWV4NHRVRixlkqSXGwJAgupxhZRwKxDAZc1OhnMA
	 +s9/+Add6mOjvF7dkOFslPg4DR6VtPMj8OwM4FBWfG+sOr84UxSeLOFdvQWSTXCx1S
	 EFF3qy8loT7lw==
Date: Mon, 24 Jun 2024 11:32:12 +0300
From: "Alexander A. Filippov" <a.filippov@yadro.com>
To: Bala Subramaniyan <Bala.Subramaniyan@ltts.com>
Subject: Re: Help with IPMB (IPMI over I2C).
Message-ID: <ZnkvDLdr-FKqt2TC@nbwork.lan>
References: <MA1PR01MB4308AF26A122B17FCC91768C80C82@MA1PR01MB4308.INDPRD01.PROD.OUTLOOK.COM>
 <ZnQiNlMOYE0ATrKK@nbwork.lan>
 <MA1PR01MB4308550B7CF6199FE4E5433A80C82@MA1PR01MB4308.INDPRD01.PROD.OUTLOOK.COM>
 <MA1PR01MB43082375F4F0563E9E6AB23080C82@MA1PR01MB4308.INDPRD01.PROD.OUTLOOK.COM>
 <ZnRNLKeblSrD92n3@nbwork.lan>
 <PN2PR01MB43159CE56C08B73540969B1480C92@PN2PR01MB4315.INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <PN2PR01MB43159CE56C08B73540969B1480C92@PN2PR01MB4315.INDPRD01.PROD.OUTLOOK.COM>
X-ClientProxiedBy: T-EXCH-08.corp.yadro.com (172.17.11.58) To
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

On Fri, Jun 21, 2024 at 07:29:38AM +0000, Bala Subramaniyan wrote:
> Hi Alexander,
>=20
> Thanks for the reply,
>=20
> Could you please suggest an approach to way forward.
>=20
> Below are the requirements.
>=20
>   1.
> BMC to BMC (IPMI over I2C), One BMC as Master and other as slave.
>   2.
> Send/Receive IPMI commands through IPMITOOL<https://github.com/openbmc/ip=
mitool/>.
>   3.
> Send/Receive SDR, SEL logs between two BMC's.
>=20

Hi Bala,

I guess You will have to write the implementation of IPMI transport for both
sides of this channel:
1. The plugin for `ipmitool` that will pack the IPMI commands to i2c/smbus
   (for the master side)
2. The plugin for `phosphor-host-ipmid`, receiving commands from i2c-slave
   connection

But it seems to me this work doesn't cost the efforts.


I guess You would achieve the required functionally if You connect both BMC=
 via
ethernet. It seems to me the such solution would be significantly easier in=
 the
described conditions.

Or You could go by another way and transfer via existing i2c-channel some o=
ther
data isn't relying on IPMI.

It depends on the global task You are solving to.

>=20
> Thanks, and regards,
> Bala Subramaniyan M.
>=20
>=20
>=20
> [cid:c0cbe0bc-b674-45a4-9cc5-477a0a219193]<https://www.ltts.com/>
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
> Sent: Thursday, June 20, 2024 9:09 PM
> To: Bala Subramaniyan <Bala.Subramaniyan@Ltts.com>
> Cc: Alexander A. Filippov <a.filippov@yadro.com>; openbmc@lists.ozlabs.or=
g <openbmc@lists.ozlabs.org>; Thangaraj S <Thangaraj.S@Ltts.com>; Lalit Kum=
ar <Lalit.Kumar2@ltts.com>
> Subject: Re: Help with IPMB (IPMI over I2C).
>=20
> CAUTION: This email is from an external source. Please do not open attach=
ments or click links from an unknown or suspicious origin. Phishing attempt=
s can be reported by using the report message button in Outlook or sending =
them as an attachment to phishing@Ltts.com. Thank you
>=20
> On Thu, Jun 20, 2024 at 01:29:18PM +0000, Bala Subramaniyan wrote:
> > Hi Alexander,
> >
> > Thanks for your reply,
> >
> > ipmitool has raw and i2c commands.
> >
> > Commands:
> >         raw           Send a RAW IPMI request and print response
> >         i2c           Send an I2C Master Write-Read command and print r=
esponse
> >         spd           Print SPD info from remote I2C device
> >         lan           Configure LAN Channels
> >
> >
> > As, I can see ipmi_rawi2c_main() function under ipmitool/lib/ipmi_raw.c=
<https://ind01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub=
=2Ecom%2Fopenbmc%2Fipmitool%2Fblob%2Fmaster%2Flib%2Fipmi_raw.c&data=3D05%7C=
02%7CBala.Subramaniyan%40ltts.com%7C2331d0069a2946fc9fcd08dc913f2bc6%7C311b=
33788e8a4b5ea33fe80a3d8ba60a%7C0%7C0%7C638544947744765697%7CUnknown%7CTWFpb=
GZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7=
C0%7C%7C%7C&sdata=3DsQIaT9zo8mKDtWbF8KdZnyf35jn%2B%2FBPlEwrh0tL9rV0%3D&rese=
rved=3D0> which is handling I2C Master Read-Write functionality.
> >
> > Can you please guide us on this, Whether we can use this to perform BMC=
-to-BMC communication.
> >
> > Below is the error i'm getting while performing BMC-to-BMC Master-Slave=
 Read-Write by connecting two i2c buses between the boards.
> > root@ast2600-default:~# ipmitool i2c bus=3D14 0x12 0x00 0x00 0x00 0x31 =
0x32 0x33 0x34
> > ipmi_master_write_read: rsp_value:6207408, LineNo:104
> > I2C Master Write-Read command failed: Invalid command
> > ipmi_rawi2c_main: rsp_value:0, LineNo:264
> > Unable to perform I2C Master Write-Read
> >
>=20
>=20
> This command doesn't define a transport for the IPMI command. It asks a r=
emote
> system to write specified bytes and read an answer via i2c bus on that re=
mote
> system. And ipmitool uses the default interface (or specified one via `-I`
> option) for this command.
>=20
> As I understood Your first message, You are looking for a transport inter=
face
> working via i2c, and I don't know the such implementations.
>=20
> It should be something that You can specify via `-I` option of ipmitool.
> By default ipmitool in OpenBMC uses `dbus` as the transport.
>=20
>=20
> > Thanks, and regards,
> > Bala Subramaniyan M,
> >
> >
> >
> >
> > [cid:8c0f8170-e1d0-4031-a57d-20b6a72ccf58]<https://ind01.safelinks.prot=
ection.outlook.com/?url=3Dhttps%3A%2F%2Fwww.ltts.com%2F&data=3D05%7C02%7CBa=
la.Subramaniyan%40ltts.com%7C2331d0069a2946fc9fcd08dc913f2bc6%7C311b33788e8=
a4b5ea33fe80a3d8ba60a%7C0%7C0%7C638544947744773561%7CUnknown%7CTWFpbGZsb3d8=
eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7=
C%7C&sdata=3DGc47QOZGRP5O7K8T23JYBjkHqMzjFMsR88ecfygbq%2Fg%3D&reserved=3D0>
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
tts.com%7C2331d0069a2946fc9fcd08dc913f2bc6%7C311b33788e8a4b5ea33fe80a3d8ba6=
0a%7C0%7C0%7C638544947744779111%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDA=
iLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=3DLZgcEN=
CI1k8SHeyxdJyux593EPlJ76bzUuIC%2B4wPahs%3D&reserved=3D0<https://ind01.safel=
inks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww.ltts.com%2F&data=3D05%=
7C02%7CBala.Subramaniyan%40ltts.com%7C2331d0069a2946fc9fcd08dc913f2bc6%7C31=
1b33788e8a4b5ea33fe80a3d8ba60a%7C0%7C0%7C638544947744783277%7CUnknown%7CTWF=
pbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D=
%7C0%7C%7C%7C&sdata=3DN2hXDj4XNNY2k4M83fPv6uR6X7XXUNFySYhMlOk%2F8SI%3D&rese=
rved=3D0><http://www.ltts.com/>
> >
> >
> >
> > ________________________________
> > From: Bala Subramaniyan <Bala.Subramaniyan@Ltts.com>
> > Sent: Thursday, June 20, 2024 6:55 PM
> > To: Alexander A. Filippov <a.filippov@yadro.com>
> > Cc: openbmc@lists.ozlabs.org <openbmc@lists.ozlabs.org>; Thangaraj S <T=
hangaraj.S@Ltts.com>; Lalit Kumar <Lalit.Kumar2@ltts.com>
> > Subject: Re: Help with IPMB (IPMI over I2C).
> >
> > Hi Alexander,
> >
> > Thanks for your reply,
> >
> > ipmitool has raw and i2c commands, Please refer below image.
> >
> > [cid:87b5aef4-9628-47c7-b7d4-b714b7a92869]
> >
> > As, I can see ipmi_rawi2c_main() function under ipmitool/lib/ipmi_raw.c=
<https://ind01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub=
=2Ecom%2Fopenbmc%2Fipmitool%2Fblob%2Fmaster%2Flib%2Fipmi_raw.c&data=3D05%7C=
02%7CBala.Subramaniyan%40ltts.com%7C2331d0069a2946fc9fcd08dc913f2bc6%7C311b=
33788e8a4b5ea33fe80a3d8ba60a%7C0%7C0%7C638544947744787269%7CUnknown%7CTWFpb=
GZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7=
C0%7C%7C%7C&sdata=3DWeGkVBWE2vqryoJ%2BpzbTeHJJUWtSpBgZtMsl5KtUP5Y%3D&reserv=
ed=3D0> which is handling I2C Master Read-Write functionality.
> >
> > Can you please guide us on this, Whether we can use this to perform BMC=
-to-BMC communication.
> >
> > Below is the error i'm getting while performing BMC-to-BMC Master-Slave=
 Read-Write by connecting two i2c buses between the boards.
> > root@ast2600-default:~# ipmitool i2c bus=3D14 0x12 0x00 0x00 0x00 0x31 =
0x32 0x33 0x34
> > ipmi_master_write_read: rsp_value:6207408, LineNo:104
> > I2C Master Write-Read command failed: Invalid command
> > ipmi_rawi2c_main: rsp_value:0, LineNo:264
> > Unable to perform I2C Master Write-Read
> >
> >
> > Thanks, and regards,
> > Bala Subramaniyan M,
> >
> >
> >
> > [cid:08db76b7-f643-4b96-8acd-5325e19c1e99]<https://ind01.safelinks.prot=
ection.outlook.com/?url=3Dhttps%3A%2F%2Fwww.ltts.com%2F&data=3D05%7C02%7CBa=
la.Subramaniyan%40ltts.com%7C2331d0069a2946fc9fcd08dc913f2bc6%7C311b33788e8=
a4b5ea33fe80a3d8ba60a%7C0%7C0%7C638544947744791162%7CUnknown%7CTWFpbGZsb3d8=
eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7=
C%7C&sdata=3D1GSmh1Pl%2BuTiSBMC7gGRqJtfklIzGmZ%2FSo%2FH3WOc4p0%3D&reserved=
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
tts.com%7C2331d0069a2946fc9fcd08dc913f2bc6%7C311b33788e8a4b5ea33fe80a3d8ba6=
0a%7C0%7C0%7C638544947744795243%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDA=
iLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=3Dp%2B7i=
gJmYz8u%2Br8WSr3Q5tQsyOgIjyqAV6dvmGBvfFq8%3D&reserved=3D0<https://ind01.saf=
elinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww.ltts.com%2F&data=3D0=
5%7C02%7CBala.Subramaniyan%40ltts.com%7C2331d0069a2946fc9fcd08dc913f2bc6%7C=
311b33788e8a4b5ea33fe80a3d8ba60a%7C0%7C0%7C638544947744798940%7CUnknown%7CT=
WFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%=
3D%7C0%7C%7C%7C&sdata=3DHyR%2Bcna4eZOvzQN5x7FqYP9UQesECVGIAPnnaoi6H84%3D&re=
served=3D0><http://www.ltts.com/>
> >
> >
> >
> > ________________________________
> > From: Alexander A. Filippov <a.filippov@yadro.com>
> > Sent: Thursday, June 20, 2024 6:06 PM
> > To: Bala Subramaniyan <Bala.Subramaniyan@Ltts.com>
> > Cc: openbmc@lists.ozlabs.org <openbmc@lists.ozlabs.org>; Thangaraj S <T=
hangaraj.S@Ltts.com>; Lalit Kumar <Lalit.Kumar2@ltts.com>
> > Subject: Re: Help with IPMB (IPMI over I2C).
> >
> > CAUTION: This email is from an external source. Please do not open atta=
chments or click links from an unknown or suspicious origin. Phishing attem=
pts can be reported by using the report message button in Outlook or sendin=
g them as an attachment to phishing@Ltts.com. Thank you
> >
> > On Thu, Jun 20, 2024 at 10:43:59AM +0000, Bala Subramaniyan wrote:
> > > Hi All,
> >
> > Hi,
> >
> > >
> > > For one of our requirement (BMC to BMC, IPMI over I2C), We're explori=
ng with IPMITOOL<https://ind01.safelinks.protection.outlook.com/?url=3Dhttp=
s%3A%2F%2Fgithub.com%2Fopenbmc%2Fipmitool&data=3D05%7C02%7CBala.Subramaniya=
n%40ltts.com%7C2331d0069a2946fc9fcd08dc913f2bc6%7C311b33788e8a4b5ea33fe80a3=
d8ba60a%7C0%7C0%7C638544947744802984%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLj=
AwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=3DG=
C02wwEeHQ9qpASA0c0I2t%2BjSMlHz9ZRq%2Bfpxy%2FapmM%3D&reserved=3D0<https://in=
d01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2Fopen=
bmc%2Fipmitool&data=3D05%7C02%7CBala.Subramaniyan%40ltts.com%7C2331d0069a29=
46fc9fcd08dc913f2bc6%7C311b33788e8a4b5ea33fe80a3d8ba60a%7C0%7C0%7C638544947=
744806939%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBT=
iI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=3D82y7wAToBrDfZIkZRezCoQxzpxzq=
hYpQO3Y55AifF9c%3D&reserved=3D0<https://github.com/openbmc/ipmitool>>>.
> > >
> > > Development Board: ASPEED AST2600 EVB
> > >
> > > Could you please suggest us how to proceed further with our below req=
uirement.
> > >
> > >   1.
> > > BMC to BMC (IPMI over I2C), One BMC as Master and other as slave.
> > >   2.
> > > Send/Receive IPMI commands through IPMITOOL<https://ind01.safelinks.p=
rotection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2Fopenbmc%2Fipmitool&=
data=3D05%7C02%7CBala.Subramaniyan%40ltts.com%7C2331d0069a2946fc9fcd08dc913=
f2bc6%7C311b33788e8a4b5ea33fe80a3d8ba60a%7C0%7C0%7C638544947744811172%7CUnk=
nown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJX=
VCI6Mn0%3D%7C0%7C%7C%7C&sdata=3D7qPcq%2FNzNZcT3HkPzYt%2FT1TUOAPSuiDJN1qE1JX=
9L1E%3D&reserved=3D0<https://ind01.safelinks.protection.outlook.com/?url=3D=
https%3A%2F%2Fgithub.com%2Fopenbmc%2Fipmitool&data=3D05%7C02%7CBala.Subrama=
niyan%40ltts.com%7C2331d0069a2946fc9fcd08dc913f2bc6%7C311b33788e8a4b5ea33fe=
80a3d8ba60a%7C0%7C0%7C638544947744814924%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC=
4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=
=3D%2F%2Fj8xGUvk6inxfHDTnABEsTV9sKo9cKp5AGJ4QggwqU%3D&reserved=3D0<https://=
github.com/openbmc/ipmitool>>> from one BMC to other.
> > >   3.
> > > Send/Receive SDR, SEL logs between two BMC's.
> > >
> > > Any help would be highly appreciated.
> > >
> > >
> >
> > As I can see, ipmitool has no any interfaces using i2c directly and I n=
ever
> > listen about using i2c as the ipmi transport.
> >
> > Google shows me that the similar question already exists and answered:
> >   https://ind01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fg=
ithub.com%2Fipmitool%2Fipmitool%2Fdiscussions%2F296&data=3D05%7C02%7CBala.S=
ubramaniyan%40ltts.com%7C2331d0069a2946fc9fcd08dc913f2bc6%7C311b33788e8a4b5=
ea33fe80a3d8ba60a%7C0%7C0%7C638544947744818379%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C=
&sdata=3DV7u1FjjwCPOAFEFIZ0BAZPTvBnXAAvJ5V%2B%2BjZU37fDw%3D&reserved=3D0<ht=
tps://ind01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.co=
m%2Fipmitool%2Fipmitool%2Fdiscussions%2F296&data=3D05%7C02%7CBala.Subramani=
yan%40ltts.com%7C2331d0069a2946fc9fcd08dc913f2bc6%7C311b33788e8a4b5ea33fe80=
a3d8ba60a%7C0%7C0%7C638544947744821873%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4w=
LjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=
=3DpruQV4OVTvDxqgq94AH7erS0pxVinHfjAqlW9%2BJ2x78%3D&reserved=3D0><https://g=
ithub.com/ipmitool/ipmitool/discussions/296>
> >
> > As an alternative, You could use lan/lanplus interfaces to communicate =
with
> > remote BMC via ethernet.
> >
> >
> > >
> > > Thanks, and regards,
> > > Bala Subramaniyan M,
> > >
> > >
> > >
> > > [cid:59c4f387-285c-4c0f-ada0-09714ca611a9]<https://ind01.safelinks.pr=
otection.outlook.com/?url=3Dhttps%3A%2F%2Fwww.ltts.com%2F&data=3D05%7C02%7C=
Bala.Subramaniyan%40ltts.com%7C2331d0069a2946fc9fcd08dc913f2bc6%7C311b33788=
e8a4b5ea33fe80a3d8ba60a%7C0%7C0%7C638544947744825423%7CUnknown%7CTWFpbGZsb3=
d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C=
%7C%7C&sdata=3DmEPJ1NiBT0nIBtqH6CymCHrswmHBhb3UGXUC813RCs8%3D&reserved=3D0>
> > >
> > >
> > > S1 Building, L&T Tech Park, Bellary Road,
> > >
> > > Next to Raintree Boulevard, Park View Layout,
> > >
> > > Byatarayanapura, Bengaluru-560092
> > >
> > > Mobile: +91 9677035467
> > >
> > > ENGINEERING THE CHANGE | https://ind01.safelinks.protection.outlook.c=
om/?url=3Dhttp%3A%2F%2Fwww.ltts.com%2F&data=3D05%7C02%7CBala.Subramaniyan%4=
0ltts.com%7C2331d0069a2946fc9fcd08dc913f2bc6%7C311b33788e8a4b5ea33fe80a3d8b=
a60a%7C0%7C0%7C638544947744829092%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwM=
DAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=3DGdWT=
Z34APtITjhplTyz5f1LxZdDmpOyaO%2BjMUzI9h%2FA%3D&reserved=3D0<https://ind01.s=
afelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww.ltts.com%2F&data=
=3D05%7C02%7CBala.Subramaniyan%40ltts.com%7C2331d0069a2946fc9fcd08dc913f2bc=
6%7C311b33788e8a4b5ea33fe80a3d8ba60a%7C0%7C0%7C638544947744832693%7CUnknown=
%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6=
Mn0%3D%7C0%7C%7C%7C&sdata=3DT%2FKaZ6o4M%2FgeBuakvxFI9Fp84n1ISXCU%2FJyGKYOXf=
Bc%3D&reserved=3D0><https://ind01.safelinks.protection.outlook.com/?url=3Dh=
ttp%3A%2F%2Fwww.ltts.com%2F&data=3D05%7C02%7CBala.Subramaniyan%40ltts.com%7=
C2331d0069a2946fc9fcd08dc913f2bc6%7C311b33788e8a4b5ea33fe80a3d8ba60a%7C0%7C=
0%7C638544947744836436%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoi=
V2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=3Dw1Jmk1S8WEt5nfT=
AgWC8xmdJ%2BsPCANJvV7j5oSst%2FTE%3D&reserved=3D0><http://www.ltts.com/>
> > >
> > >
> > >
> > > [Ltts.com]
> > >
> > > L&T Technology Services Ltd
> > >
> > > https://ind01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fww=
w.ltts.com%2F&data=3D05%7C02%7CBala.Subramaniyan%40ltts.com%7C2331d0069a294=
6fc9fcd08dc913f2bc6%7C311b33788e8a4b5ea33fe80a3d8ba60a%7C0%7C0%7C6385449477=
44840097%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTi=
I6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=3DVaMxCES6V7qlsf6nEd3EjQt9Z6XJQ=
DZyCRWc8xWRPYM%3D&reserved=3D0<https://ind01.safelinks.protection.outlook.c=
om/?url=3Dhttp%3A%2F%2Fwww.ltts.com%2F&data=3D05%7C02%7CBala.Subramaniyan%4=
0ltts.com%7C2331d0069a2946fc9fcd08dc913f2bc6%7C311b33788e8a4b5ea33fe80a3d8b=
a60a%7C0%7C0%7C638544947744843870%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwM=
DAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=3DvGwy=
Z9JiQL8rq84V4cyFUF6oq8zgk%2FuY1BWFU%2BhiRZk%3D&reserved=3D0><http://www.ltt=
s.com/>
> > >
> > > L&T Technology Services Limited (LTTS) is committed to safeguard your=
 privacy. Read the appropriate privacy notice<https://ind01.safelinks.prote=
ction.outlook.com/?url=3Dhttps%3A%2F%2Fwww.ltts.com%2Fprivacy-policies-noti=
ces&data=3D05%7C02%7CBala.Subramaniyan%40ltts.com%7C2331d0069a2946fc9fcd08d=
c913f2bc6%7C311b33788e8a4b5ea33fe80a3d8ba60a%7C0%7C0%7C638544947744847397%7=
CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwi=
LCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=3DlG2z6dFm80s0oZRXtyv5pmi43S%2BcX9bxaooU%=
2FO1zAlo%3D&reserved=3D0<https://ind01.safelinks.protection.outlook.com/?ur=
l=3Dhttps%3A%2F%2Fwww.ltts.com%2Fprivacy-policies-notices&data=3D05%7C02%7C=
Bala.Subramaniyan%40ltts.com%7C2331d0069a2946fc9fcd08dc913f2bc6%7C311b33788=
e8a4b5ea33fe80a3d8ba60a%7C0%7C0%7C638544947744851086%7CUnknown%7CTWFpbGZsb3=
d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C=
%7C%7C&sdata=3Dy%2BMMmKKFtM%2By06EH9iC2rM39IKsg2GKeqT21%2FzC4MtY%3D&reserve=
d=3D0<https://www.ltts.com/privacy-policies-notices>>> applicable to you to=
 know more about how LTTS collects, uses and stores your personal data. Ple=
ase visit our privacy policy<https://ind01.safelinks.protection.outlook.com=
/?url=3Dhttps%3A%2F%2Fwww.ltts.com%2Fdata-privacy-policy&data=3D05%7C02%7CB=
ala.Subramaniyan%40ltts.com%7C2331d0069a2946fc9fcd08dc913f2bc6%7C311b33788e=
8a4b5ea33fe80a3d8ba60a%7C0%7C0%7C638544947744854952%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%=
7C%7C&sdata=3D6lXolxhbmqyKJsTFXqmuJBB3y4H%2BqPViYwCipoTGgPY%3D&reserved=3D0=
<https://ind01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww.lt=
ts.com%2Fdata-privacy-policy&data=3D05%7C02%7CBala.Subramaniyan%40ltts.com%=
7C2331d0069a2946fc9fcd08dc913f2bc6%7C311b33788e8a4b5ea33fe80a3d8ba60a%7C0%7=
C0%7C638544947744858658%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjo=
iV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=3DG02ipd8nDw%2Fg=
IUbNhbF9X%2FlDdVLEu6PED8Vs1X%2Bf3%2FI%3D&reserved=3D0<https://www.ltts.com/=
data-privacy-policy>>> available on our website https://ind01.safelinks.pro=
tection.outlook.com/?url=3Dhttp%3A%2F%2Fwww.ltts.com%2F&data=3D05%7C02%7CBa=
la.Subramaniyan%40ltts.com%7C2331d0069a2946fc9fcd08dc913f2bc6%7C311b33788e8=
a4b5ea33fe80a3d8ba60a%7C0%7C0%7C638544947744862422%7CUnknown%7CTWFpbGZsb3d8=
eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7=
C%7C&sdata=3DWNmcpxHSxuE%2B3QyPQDWIA%2Bg%2FB2heNLkU54e%2FB5yujr0%3D&reserve=
d=3D0<https://ind01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fww=
w.ltts.com%2F&data=3D05%7C02%7CBala.Subramaniyan%40ltts.com%7C2331d0069a294=
6fc9fcd08dc913f2bc6%7C311b33788e8a4b5ea33fe80a3d8ba60a%7C0%7C0%7C6385449477=
44866461%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTi=
I6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=3Dk7gVerT9KSOp7enKmThxwY4ztDa3d=
mfVpkxPkaHR39o%3D&reserved=3D0><http://www.ltts.com/> for more information =
about our commitment towards data privacy under applicable data protection =
laws. This email may contain confidential or privileged information for the=
 intended recipient(s). If you are not the intended recipient, please do no=
t use or disseminate the information, notify the sender and delete it from =
your system.

--
Regads,
Alexander Filippov




