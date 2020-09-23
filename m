Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD6F2761DE
	for <lists+openbmc@lfdr.de>; Wed, 23 Sep 2020 22:18:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BxTyh1c15zDqg3
	for <lists+openbmc@lfdr.de>; Thu, 24 Sep 2020 06:18:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=anoo@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=H5daihSn; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BxTxY3Fn8zDqkR;
 Thu, 24 Sep 2020 06:17:37 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08NK3BSR020777; Wed, 23 Sep 2020 16:17:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=mime-version :
 content-type : content-transfer-encoding : date : from : to : cc : subject
 : in-reply-to : references : message-id; s=pp1;
 bh=PuzvvneQVwM4h8z29NO93ALdpnsY3WbVEPywCpubVpo=;
 b=H5daihSnvC97G3g2nRA/u1nmIh4z7+pCk5d+NDhRALy95BJCaZ9pDqjdmqGVvXU+uvHm
 qKaLqi/e2rWyEfUt0ytmv/M8Xk5tclWja3+vBWQ5qEzpaHOqiOzZxsjIPMve66Tzlvvc
 MJWseR1S6XVURHx7ppoPJiriJieBJ96Hg0Eql+pJ0NjJOQZVlp71GyIGYVyLZMHG1uGZ
 jyRvz9vaftkVQOTkMXvpZEwqw5TQtkURu/QMfuSxo7ROYrFNQTJRzL2unncFsS8EHS9m
 9pqXnXE9R3m//JTN5VusHFxv61clEoQMDBRKMb9Leyxt5H+DvpQ3k3jvDFAmujNP/6R5 ig== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33rcxdrj0m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Sep 2020 16:17:31 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08NKCAwP018782;
 Wed, 23 Sep 2020 20:17:29 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma04wdc.us.ibm.com with ESMTP id 33r5e8c7yq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Sep 2020 20:17:29 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08NKHTVl42008884
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Sep 2020 20:17:29 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 55F6A12405B;
 Wed, 23 Sep 2020 20:17:29 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BAF8C124054;
 Wed, 23 Sep 2020 20:17:28 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 23 Sep 2020 20:17:28 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 23 Sep 2020 15:17:28 -0500
From: Adriana Kobylak <anoo@linux.ibm.com>
To: Patrick Williams <patrick@stwcx.xyz>
Subject: Re: Read Firmware Versions
In-Reply-To: <20200923153510.GP6152@heinlein>
References: <SG2PR04MB3093CAA5913439BB892C16E5E13A0@SG2PR04MB3093.apcprd04.prod.outlook.com>
 <20200921152337.GJ6152@heinlein>
 <SG2PR04MB3093A25A217B7E1FFD65D8A8E13B0@SG2PR04MB3093.apcprd04.prod.outlook.com>
 <20200923153510.GP6152@heinlein>
Message-ID: <974e9c2abdf54c96038585730403d5b9@linux.vnet.ibm.com>
X-Sender: anoo@linux.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-23_16:2020-09-23,
 2020-09-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 phishscore=0
 priorityscore=1501 clxscore=1011 impostorscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 mlxscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009230150
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
Cc: "Velumani T-ERS, HCLTech" <velumanit@hcl.com>, openbmc@lists.ozlabs.org,
 Jayashree D <jayashree-d@hcl.com>,
 openbmc <openbmc-bounces+anoo=linux.ibm.com@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 2020-09-23 10:35, Patrick Williams wrote:
> On Tue, Sep 22, 2020 at 01:34:50PM +0000, Jayashree D wrote:
>> Classification: HCL Internal
>> 
>> Thanks Patrick for your response.
>> 
>> In phosphor-bmc-code-mgmt, I am seeing the software image is upgraded 
>> and based on the image update, version is updated.
>> But in my platform, I have to read firmware versions using oem 
>> commands and that version should be displayed under dbus objects.
>> Whether phosphor-bmc-code-mgmt repo will be suitable to display the 
>> firmware version using dbus objects?
> 
> Vijay recently added a simple BIOS flash management to
> phosphor-bmc-code-mgmt, but there is also a openpower-pnor-code-mgmt 
> for
> the equivalent of BIOS management on openpower systems.  Since your 
> code
> update scheme is likely to be specific to your IPMB commands, I don't
> know if that would be best in a separate repository or an extension 
> onto
> phosphor-bmc-code-mgmt.
> 
> Adriana, any opinions?

It could fit in phosphor-bmc-code-mgmt, some thoughts:

The d-bus objects get created at 2 different times:

1. One scenario is when an image is uploaded to be updated, this is the 
support that Vijay added which allows a custom script to be run to 
update the BIOS image. If you're interested in this method for updating 
your BIOS, you could potentially add your IPMB commands in that service 
and use the Activation interfaces to drive the update.

2. The second scenario is when the BMC reboots and it recreates the 
d-bus objects. For this scenario, there's no currently support for BIOS, 
so for example the support that Vijay added does not create a d-bus 
interface if the BMC reboots, which is ok if you only want to use the 
Activation interface to trigger the update. But sounds like you want to 
always have the version information as a d-bus object, so support for 
BIOS could be added. For example, to get the BMC levels, the code looks 
for version information in the BMC in the media directory. If you get 
your app to get the version information via the oem commands you 
mentioned and create a file in the bmc in the media directory we could 
extend the logic to create the Version d-bus objects for each BIOS 
version when the BMC reboots. We'd just need to work out the details for 
the format for the files that would host the version information, and 
how to identify they're BIOS versions vs BMC.
