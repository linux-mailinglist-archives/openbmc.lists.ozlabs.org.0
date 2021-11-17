Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF49454E06
	for <lists+openbmc@lfdr.de>; Wed, 17 Nov 2021 20:37:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HvY9Q4HrFz2ywW
	for <lists+openbmc@lfdr.de>; Thu, 18 Nov 2021 06:37:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ChU2bvkP;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ChU2bvkP; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HvY8x6f7Cz2yb6
 for <openbmc@lists.ozlabs.org>; Thu, 18 Nov 2021 06:37:05 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AHICLbC016559
 for <openbmc@lists.ozlabs.org>; Wed, 17 Nov 2021 19:36:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=N8kC8vVYFyDaLKgp/AsiPgqFShpKyr/1wBPImHX0LJc=;
 b=ChU2bvkPHU0k5nSah9WmXD3iVZeOuXET1Grl993aq6tNB/qkNvWAveVnBbd2MePsoO88
 RlDMGLdpK4MPdNZrm88x6HDrNEW6CLZyUVxzk2qUNQ/WWnHPg2uahF/k3o3ZwdCXQ07I
 R0dMH9KN4za/VMcETGTboHvccGytf4q4zwzD9m4dTvoWr/nv5L97uYWKILebE8ZYBRnR
 6hQfHT2U2dxJwVCRjwC1HZgMClDNKyY9+b7DBDL21V+0v5bGoS7pi+c7TpxHwPaCNYHV
 RUS5ZNmYERXP1VLbO2Nsi3CO9GGazrfrj6w3ODWcGQK83+5FjJOJa0NN3baIY/f41TQm hg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cd6tgsm9j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 17 Nov 2021 19:36:58 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1AHJaNPf020246
 for <openbmc@lists.ozlabs.org>; Wed, 17 Nov 2021 19:36:58 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cd6tgsm98-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Nov 2021 19:36:58 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AHJXmvu020222;
 Wed, 17 Nov 2021 19:36:57 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma03dal.us.ibm.com with ESMTP id 3ca50cf1v6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Nov 2021 19:36:57 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1AHJatoD64684458
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 17 Nov 2021 19:36:55 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CFD05AC05B;
 Wed, 17 Nov 2021 19:36:55 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2AFDCAC066;
 Wed, 17 Nov 2021 19:36:55 +0000 (GMT)
Received: from [9.160.181.81] (unknown [9.160.181.81])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
 Wed, 17 Nov 2021 19:36:54 +0000 (GMT)
Message-ID: <d6654531-a50b-665f-36a8-0ad1b27bcf88@linux.ibm.com>
Date: Wed, 17 Nov 2021 13:36:53 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: Redfish implementation does not supply SoftwareId
Content-Language: en-US
To: Richard Hughes <hughsient@gmail.com>, openbmc@lists.ozlabs.org,
 Adriana Kobylak <anoo@linux.ibm.com>
References: <CAD2FfiGpG_J5W8Ftdp5wE2wLB=7Tfmvfmivy0_4vW=D0fYdw3g@mail.gmail.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
In-Reply-To: <CAD2FfiGpG_J5W8Ftdp5wE2wLB=7Tfmvfmivy0_4vW=D0fYdw3g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: vePQnekIDGD2_7ATCJIdXvphFNQHl8-c
X-Proofpoint-GUID: iCpYjG2Dcbz-Atzw2c2unRIEm5odVG7N
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-17_07,2021-11-17_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0
 mlxlogscore=999 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111170084
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

On 11/11/21 8:16 AM, Richard Hughes wrote:
> Hi all,
>
> My name is Richard Hughes and I'm the upstream maintainer of fwupd
> which is a linux program that allows flashing hardware. It's used by a
> few million people already and there's recently been a lot of interest
> about getting fwupd to run on the actual BMC chip, rather than on the
> host OS. That's not really what this email is about, but might explain
> the bigger picture. I'll come back to this in a few weeks time :)

Richard,

Thanks for your email!  I don't have any answers, and my intention for 
this email is to stir up some discussion.  There was some previous work 
in this area described here: 
https://lists.ozlabs.org/pipermail/openbmc/2020-May/021573.html

Where can we learn more about the interest in getting `fwupd` to run on 
the BMC?  Links to chat room, email archive, etc?

Background: OpenBMC's current documented [features][] for [firmware 
update][] is given here:
[features]: https://github.com/openbmc/docs/blob/master/features.md
[firmware update]: 
https://github.com/openbmc/docs/blob/master/architecture/code-update/code-update.md

In this context, I understand you are interested in either (A) adding 
support for a new fwupd method or (B) creating a new OpenBMC function to 
update the firmware for various host components, or (C) both.  That 
seems to me like a good fit with OpenBMC.

And please note I am not familiar with [fwupd][].
[fwupd]: https://github.com/fwupd/fwupd


> At the moment fwupd runs on the host OS and uses a plugin to
> communicate with various Redfish implementations, for example iDRAC
> for Dell or XClarity for Lenovo. Teddy Reed kindly donated (loaned?)
> me some hardware so I could test the fwupd plugin against the Redfish
> implementation of OpenBMC, more specifically git master on a
> evb-ast2500 board.
>
> With a small patch to fwupd (setting CURLOPT_SSL_VERIFYHOST=0) it
> seems to load and enumerate correctly, but doesn't add any devices.

Do I infer correctly that you got `fwupd` running on the BMC, for 
example having a working `fwupdmgr` command?

> The reason I found was that the SoftwareId property is missing from
> the /redfish/v1/UpdateService/FirmwareInventory/7d021ade path. The
> SoftwareId is the "key" that maps the hardware to a specific firmware
> *stream*, so for instance it could be something like
> "USB\VID_17EF&PID_3083" for a peripheral or some other kind of
> vendor-specific string, e.g. "SAMSUNG MZVLB2T0HALB-000L7". The idea is
> that vendors then upload firmware to the LVFS website with a defined
> *stream* and updates get deployed onto matching hardware
> automatically. I'm not so sure that makes a huge amount of sense for
> the OpenBMC BMC image itself. Or maybe it does; getting new official
> OpenBMC images from the LVFS would be way cool, but I don't think we
> want to flash the entire MTD image. Anyway, I digress.

Use cases:

I understand OpenPOWER system firmware has two firmware packages which 
are typically packaged together: (1) the BMC firmware image and (2) the 
host firmware image.  The host image itself contains multiple parts but 
the BMC does not handle them separately.  Given this, firmware updates 
are monoliotic and are not done to individual components.  (But note my 
understanding is limited.)

I understand the other systems (mentioned above) support updating the 
firmware for various individual host components.

> I guess my question is if I could get a SoftwareId set for 7d021ade --
> e.g. "evb-ast2500" -- that at least allows the device to enumerate in
> fwupd and gives me something to test against. I guess my next question
> is how a OpenBMC distributor adds a new device into
> /redfish/v1/UpdateService/FirmwareInventory.Members -- and if there's
> a way to set SoftwareId for that new device too.

I don't understand enough background in this area.  OpenBMC's [BMCWeb][] 
has pulled in the Redfish [SoftwareInventory schema][] and has an 
[update service implementation][] but has not yet implemented the 
`SoftwareId` property.  I think you want that.  But I don't know if that 
will give you what you need.

[BMCWeb]: https://github.com/openbmc/bmcweb
[SoftwareInventory schema]: 
https://github.com/openbmc/bmcweb/blob/master/static/redfish/v1/JsonSchemas/SoftwareInventory/SoftwareInventory.json
[update service implementation]: 
https://github.com/openbmc/bmcweb/blob/master/redfish-core/lib/update_service.hpp

One more thing I don't know... :-) Where is the right place (via 
Yocto/bitbake recipes) to set the SoftwareId?  Somewhere around here?:
- Base OpenBMC support: 
https://github.com/openbmc/openbmc/blob/master/meta-phosphor/recipes-phosphor/images/obmc-phosphor-image.bb
- Customization for IBM machines: 
https://github.com/openbmc/openbmc/blob/master/meta-ibm/recipes-phosphor/images/obmc-phosphor-image.bbappend
- In the class for the above: 
https://github.com/openbmc/openbmc/blob/master/meta-phosphor/classes/image_types_phosphor.bbclass

I hope this helps.

Joseph

>
> Sorry if all these are newbie questions, and I appreciate any
> pointers; I'm happy to send patches. Thanks.
>
> Richard.

