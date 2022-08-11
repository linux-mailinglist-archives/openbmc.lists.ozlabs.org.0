Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C0E590706
	for <lists+openbmc@lfdr.de>; Thu, 11 Aug 2022 21:36:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M3cWD6Jw6z3bYy
	for <lists+openbmc@lfdr.de>; Fri, 12 Aug 2022 05:36:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=sO5h9OFp;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com; envelope-from=a.kartashev@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=sO5h9OFp;
	dkim-atps=neutral
X-Greylist: delayed 472 seconds by postgrey-1.36 at boromir; Fri, 12 Aug 2022 05:36:16 AEST
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M3cVm5Cwtz2xX6
	for <openbmc@lists.ozlabs.org>; Fri, 12 Aug 2022 05:36:16 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
	by mta-01.yadro.com (Postfix) with ESMTP id DB71341391;
	Thu, 11 Aug 2022 19:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
	mime-version:user-agent:content-transfer-encoding:content-type
	:content-type:organization:references:in-reply-to:date:date:from
	:from:subject:subject:message-id:received:received:received
	:received; s=mta-01; t=1660246098; x=1662060499; bh=hxpZPLpgzB5h
	+MSO4wt6KalD6e5MAjziFzthRkvEoFY=; b=sO5h9OFpLX7MJq4fPQeSx0VckCTI
	NV80Pt5m6ACifDdnrTPkNYgrYT5OrG7P27Zny0oTjbisEvhqgm+MLMA3v2kVBgQ6
	gn7JTC5vFJIDr+PVR/CKjGiArd/4g2FPC1XFwEwdC54d46t3578LCbEnruIXeYan
	pCinv+f63ybxcJc=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
	by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X21tDdm-KfKC; Thu, 11 Aug 2022 22:28:18 +0300 (MSK)
Received: from T-EXCH-01.corp.yadro.com (t-exch-01.corp.yadro.com [172.17.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mta-01.yadro.com (Postfix) with ESMTPS id 920C34138F;
	Thu, 11 Aug 2022 22:28:18 +0300 (MSK)
Received: from T-EXCH-09.corp.yadro.com (172.17.11.59) by
 T-EXCH-01.corp.yadro.com (172.17.10.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Thu, 11 Aug 2022 22:28:18 +0300
Received: from [10.199.0.26] (10.199.0.26) by T-EXCH-09.corp.yadro.com
 (172.17.11.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1118.9; Thu, 11 Aug
 2022 22:28:17 +0300
Message-ID: <794cf20fd781d5a28746800c05b41b866c099483.camel@yadro.com>
Subject: Re: Adding Inventory
From: Andrei Kartashev <a.kartashev@yadro.com>
To: =?UTF-8?Q?O=C4=9Fuzhan_=C3=87A=C4=9ELAR?= <oguzhan.caglar@pavotek.com.tr>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Date: Thu, 11 Aug 2022 22:28:16 +0300
In-Reply-To: <6fbe1a4cf05a483b86986e1cdf5f53aa@pavotek.com.tr>
References: <6fbe1a4cf05a483b86986e1cdf5f53aa@pavotek.com.tr>
Organization: YADRO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.2 
MIME-Version: 1.0
X-Originating-IP: [10.199.0.26]
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

Hello Oguzhan,

This is a very common question for newcomers, I believe is was already
answered somewhere in the list.
BMC out of the box don't have any knowledge on host's equipment (CPU,
DIMM, Drive, AIC, etc) - it is up to you to deliver this information
from host to BMC. As for now the most common way to feed BMC the
information regarding CPU and DIMM is to transfer smbios tables via
ipmi. You can implement any other mechanism but any way, you need to
have some code in your BIOS.

As soon as you have the CPU/DIMM information on BMC it can be shown in
bmcweb by implementing corresponding dbus interfaces
(xyz.openbmc_project.Inventory.Item.Cpu and
xyz.openbmc_project.Inventory.Item.Dimm). smbiosmdrv2 daemon do this,
but you also can add EntityManager configuration files for this or
write your own daemon to expose the interfaces.

On Thu, 2022-08-04 at 08:07 +0000, O=C4=9Fuzhan =C3=87A=C4=9ELAR wrote:
> Hello,
>=20
> I'm working on openbmc for ast2500 bmc. I want to add inventory such
> as CPU and DIMM etc. I added the chassis from=C2=A0.json file but I
> couldn't add the CPU and DIMM. I know this is to related with entity-
> manager.=C2=A0How can I add these inventory on WEBUI? Can you give some
> information about this issue?
>=20
> Regards.
>=20
> O=C4=9Fuzhan =C3=87a=C4=9Flar
> Software Design Engineer
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

--=20
Best regards,
Andrei Kartashev,
Lead BMC Developer

