Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBD7273472
	for <lists+openbmc@lfdr.de>; Mon, 21 Sep 2020 22:59:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BwGz01Ls1zDqxq
	for <lists+openbmc@lfdr.de>; Tue, 22 Sep 2020 06:59:40 +1000 (AEST)
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
 header.s=pp1 header.b=OZYVuiVv; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BwGxr6YcVzDqv2
 for <openbmc@lists.ozlabs.org>; Tue, 22 Sep 2020 06:58:40 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08LKWlxW003579; Mon, 21 Sep 2020 16:58:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=mime-version :
 content-type : content-transfer-encoding : date : from : to : cc : subject
 : in-reply-to : references : message-id; s=pp1;
 bh=L7W+H58g683Hnls6/x49roNwJ3/8zr2rhYzn311U/KA=;
 b=OZYVuiVvZv313uMLUcC3IT9BVgebqOOCAtCsrpz7sePXj2GCblOMM61LzTj6yZ9FUkB5
 /Yie0w44EDb7sNHWKjEUt268TbMpO/xPUC4ku1a4jvoMUI0ku9SG2ZXpgQxJma9fRrGv
 dahTGheNcGk+0ZdMB2giXRQkGLTOZLSjt70N/bxEhI3e6qR9ik7Kqdlh1DeyW3xTuJGB
 eFq9f8e68okgQIEe961HVXf2ugt2L+ekOj76q71jRgK9IL799PLBXWwKsPd0UGZvt/oU
 nqECDbjTCDkxOJcH1OPVRrn78yNKD2NSa3W8nwk4opf0V2olKQo85UwyaMfuW7YY5Vc8 uQ== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33q32grudm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Sep 2020 16:58:33 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08LKkqic009506;
 Mon, 21 Sep 2020 20:58:32 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma03dal.us.ibm.com with ESMTP id 33n9m8xfwt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Sep 2020 20:58:32 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08LKwUrn49611194
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Sep 2020 20:58:30 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 03CCA6A051;
 Mon, 21 Sep 2020 20:58:30 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A508E6A04F;
 Mon, 21 Sep 2020 20:58:29 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 21 Sep 2020 20:58:29 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 21 Sep 2020 15:58:29 -0500
From: Adriana Kobylak <anoo@linux.ibm.com>
To: Patrick Williams <patrick@stwcx.xyz>
Subject: Re: Multi host bios upgrade support in phosphor-bmc-code-mgmt:
In-Reply-To: <20200921194614.GL6152@heinlein>
References: <TY2PR04MB33112E61CA54FE1A17D30B70CA3A0@TY2PR04MB3311.apcprd04.prod.outlook.com>
 <20200921194614.GL6152@heinlein>
Message-ID: <b6cd8ac0b56a372391bd108dbf84fb0f@linux.vnet.ibm.com>
X-Sender: anoo@linux.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-21_09:2020-09-21,
 2020-09-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 mlxscore=0 suspectscore=0 impostorscore=0 mlxlogscore=999 spamscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 clxscore=1011
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009210151
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
Cc: "P. Priyatharshan" <PriyatharshanP@hcl.com>, gmills@linux.vnet.ibm.com,
 openbmc@lists.ozlabs.org, anoo@us.ibm.com, ojayanth@in.ibm.com,
 Sundaramoorthy Thiyagarajan <sundaramoorthyt@hcl.com>, "Velumani T-ERS,
 HCLTech" <velumanit@hcl.com>, ratagupt@linux.vnet.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 2020-09-21 14:46, Patrick Williams wrote:
> On Mon, Sep 21, 2020 at 05:49:14PM +0000, P. Priyatharshan wrote:
>> 
>> Hi ,
>> 
>> Phosphor-software-manager currently supports bios upgrade for a single 
>> host.I would like to propose a design to add multi host bios upgrade 
>> support in Phosphor-software-manager.
>> 
>> Kindly review the below proposal and share your valuable comments.
>> 
>> Design:
>> 
>> a) : Add Host Number
>> 
>> 1) MANIFEST file change:
>> 
>> Add  host number in MANIFEST file, purpose field like below.
>> 
>> Ex:
>> For Host1,  
>> purpose=xyz.openbmc_project.Software.Version.VersionPurpose.Host1
>> For Host2,  
>> purpose=xyz.openbmc_project.Software.Version.VersionPurpose.Host2 and 
>> So on.
> 
> These 'purpose' values align with the Purpose field in Software.Version
> (and the VersionPurpose enumeration).  We really don't want to add Host
> positions to this enumeration set.
> 
> Why would a MANIFEST file have a different value for a different host
> position anyhow?  Isn't the appropriate firmware image for your host
> card dependent on which host-card-hardware you have installed and not
> which position the card is in?  The type of hardware should be handled
> by ExtendedVersion.
> 
> I can't imagine that a 16-blade BladeCenter would want to have 16
> different files for each slot in the BladeCenter.  That doesn't sound
> like a great user experience.
> 
>> 2) For bios upgrade, handle the same to incorporate the host number 
>> and send host number to the systemd service 
>> obmc-flash-host-bios@service like below.
>> 
>>   if (host.empty())
>>     {
>>         auto biosServiceFile = "obmc-flash-host-bios@" + versionId + 
>> ".service";
>>     }
>>     else
>>     {
>>         auto biosServiceFile =
>>             "obmc-flash-host-bios@" + versionId + "_" + host + 
>> ".service";
>>     }
> 
> It doesn't seem like systemd had a clear mechanism to create a
> 'multi-parameter template' which seems to be what you're asking for.  
> We
> should probably define a convention for openbmc.  I'm somewhat 
> surprised
> that versionId is part of the template parameters to begin with.
> 
> I think there is a question you've missed (assuming we're not using the
> purpose field to identify which host): How do we handle activation for
> firmware images which can apply to multiple entities?  Today, as best I
> can tell, there is a 1:1 mapping between firmware images and inventory
> items they apply on.  At least, this is the case in
> phosphor-bmc-code-mgmt, which is where this code you linked to is.
> 
> Reading the section "ItemUpdater" at [1], it seems that we can have
> multiple Activation interfaces for a single Software version and these
> Activation interfaces are expected to be associated to the
> Inventory.Item they manage.  This would mean that we should create <N>
> activation objects, one for each host, and modifying
> `RequestedActivation` will activate only for that host.
> 
> (Adriana can maybe weight in here?)

Agree with what Patrick has said.
One current limitation is the version id is generated from the firmware 
version string, meaning that it can't be duplicate d-bus interfaces with 
the same version id.
One feature that I think will help with this multi-host scenario is that 
I'll be pushing up a change for review to generate the id based on 
firmware version plus the device or volume where the firmware version 
resides, thus allowing different multiple interfaces with the same 
firmware version. The use-case is to allow BMCs that support two 
firmware versions to have the same firmware on both sides.
This can then be used for multi-host by creating an Activation interface 
for each host even if the firmware image we want to install is the same 
for multiple host targets, by using some unique identifier for each host 
instance to generate the id.

> 
>> 
>> b) : Implement a generic IPMI based multi-host bios upgrade.
>> 
>> 1) This generic implementation expects a json config file with the 
>> details like IPMI net function , command id, and etc and process the 
>> bios upgrade via ipmi commands.
> 
> I'm not following how this is related unless this is the code inside
> 'obmc-flash-host-bios@'?  You're not expecting this IPMI function to
> dynamically create your MANIFEST, are you?  MANIFEST files need to be
> digitally signed when you're doing secure updates, so you cannot
> dynamically manipulate them.
> 

The phosphor-bmc-code-mgmt repo manages out-of-band updates. Maybe the 
IPMI flash repo[2] is relevant here? It has tools to do an inband update 
through IPMI to the bmc and host.

> 
> 1.
> https://github.com/openbmc/phosphor-dbus-interfaces/tree/master/xyz/openbmc_project/Software#itemupdater

2. https://github.com/openbmc/phosphor-ipmi-flash
