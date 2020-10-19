Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AA467292E6D
	for <lists+openbmc@lfdr.de>; Mon, 19 Oct 2020 21:27:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CFRbf3HldzDqdk
	for <lists+openbmc@lfdr.de>; Tue, 20 Oct 2020 06:27:26 +1100 (AEDT)
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
 header.s=pp1 header.b=SpgfsBjv; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CFRZr0Kg0zDqYC
 for <openbmc@lists.ozlabs.org>; Tue, 20 Oct 2020 06:26:42 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09JJ2nik155715; Mon, 19 Oct 2020 15:25:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=mime-version :
 content-type : content-transfer-encoding : date : from : to : cc : subject
 : in-reply-to : references : message-id; s=pp1;
 bh=7zGteMLdISHHUBDM6lLyckUlmyEOHzsSEiIsFxUigI4=;
 b=SpgfsBjvRG2VZr4/dWEIlNmuca5osyvwfeiUnha/G4Xsx6dKt26IfEJM23MIYaEe2xsT
 LO9tyWMno0C1lLvZLzDBdihwOIXRurEVqWeWFlIsezverB1dZmQ+7EOQ/HzdOCHcle/w
 dN4FnwdpmSTCRxlemItrz5ygDwzihdLoffSLb2IxEpGdybr57x2HoFy+H/L+I7GBPDkl
 bnj8EGmx+USTENpXXLTo7dArQSylAIkigpy6V1UGZzs8o3y2ryL+nKbhSnOPKAV7NwnY
 RNRNCJGYDJsdsX9m3WkNHP3ZmtxRvvhktPg1YJeg9h2DMzHJ6V/fmvzm/0pHXi8zdEgI eQ== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 349g59hdp0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Oct 2020 15:25:57 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09JJM0qL025499;
 Mon, 19 Oct 2020 19:25:56 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma03dal.us.ibm.com with ESMTP id 347r88xtpe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Oct 2020 19:25:55 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09JJPmd546858502
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Oct 2020 19:25:48 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 20D9ABE053;
 Mon, 19 Oct 2020 19:25:53 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C751EBE054;
 Mon, 19 Oct 2020 19:25:52 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 19 Oct 2020 19:25:52 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date: Mon, 19 Oct 2020 14:25:52 -0500
From: Adriana Kobylak <anoo@linux.ibm.com>
To: "P. Priyatharshan" <PriyatharshanP@hcl.com>
Subject: Re: Multi host bios upgrade support in phosphor-bmc-code-mgmt:
In-Reply-To: <TY2PR04MB33110CD5532EF9CE5F3FD949CA1E0@TY2PR04MB3311.apcprd04.prod.outlook.com>
References: <TY2PR04MB33112E61CA54FE1A17D30B70CA3A0@TY2PR04MB3311.apcprd04.prod.outlook.com>
 <20200921194614.GL6152@heinlein>
 <b6cd8ac0b56a372391bd108dbf84fb0f@linux.vnet.ibm.com>
 <TY2PR04MB33117717F809C0804A00B365CA300@TY2PR04MB3311.apcprd04.prod.outlook.com>
 <TY2PR04MB3311812DB85A11934F044FB4CA0C0@TY2PR04MB3311.apcprd04.prod.outlook.com>
 <893bbe2bbfe35c6ccdea0988c8ec1de9@linux.vnet.ibm.com>
 <SL2PR04MB330696831B49B81F75168538CA020@SL2PR04MB3306.apcprd04.prod.outlook.com>,
 <8EF4ECDB-2EA4-4620-B7EE-FBB899FD1C47@fb.com>
 <TY2PR04MB33110CD5532EF9CE5F3FD949CA1E0@TY2PR04MB3311.apcprd04.prod.outlook.com>
Message-ID: <ce091343af20328a24f1b1f02fca3ec4@linux.vnet.ibm.com>
X-Sender: anoo@linux.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-19_08:2020-10-16,
 2020-10-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 impostorscore=0
 clxscore=1011 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010190127
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
Cc: openbmc@lists.ozlabs.org, anoo@us.ibm.com, ojayanth@in.ibm.com,
 gmills@linux.vnet.ibm.com, "Velumani T-ERS, HCLTech" <velumanit@hcl.com>,
 Vijay Khemka <vijaykhemka@fb.com>, ratagupt@linux.vnet.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Vijay is correct in that today the image file is deleted after a 
successful activation. Therefore today's logic will for example delete 
the file from /tmp/images/ after Host1 was updated, and a subsequent 
request to update Host2 would fail because the image file would not 
exist anymore. The reason for deleting the file is to preserve space 
since the file is assumed that it's not needed anymore after it was used 
for activation. Otherwise we can potentially fill up the /tmp space.

Let's say we keep the image files around forever in /tmp/images/, next 
I'm thinking about the Redfish API where the upload and activation is a 
single step, we'd need to figure out how to specify which Host instances 
should be updated.

One thought is to create a property that the user specifies for which 
Host they want to update. This would require creating the 
/xyz/openbmc_project/software/hostX interfaces and the new property when 
the BMC starts up. Then for example:
- User sets the new "this should be updated" property for host1 and 
host3.
- User calls the Redfish API and select the bios image to upload.
- The BMC updater sees it's a host bios image and creates 
hostX/<versionid> interfaces
- THe BMC updater calls the bios_X updater script for only the host 
instances that have the "this should be updated" property set.

It'd also be good if you could check if Redfish has an ability to 
somehow specify the target that needs to be updated, or if others have 
implemented this ability in some other way.



On 2020-10-19 12:08, P. Priyatharshan wrote:
> [Vijay's Comment] >Can we use extraversion field in manifest file to
> identify host...
> 
>  		 This Message Is From an External Sender
> 
>  		 This message came from outside your organization.
> 
>  [Vijay's Comment]
>> Can we use extraversion field in manifest file to identify host id.
> In manifest file, if purpose is >host then we can check extra version
> and >find out which host it is applicable for.
> 
>  [Priyatharshan Response]
> We have already brought up the point of using manifest file. As a
> response, Patrick mentioned as
> "I can't imagine that a 16-blade BladeCenter would want to have 16
> different files for each slot in the BladeCenter. That doesn't sound
> like a great user experience".
> 
> [Vijay's Comment]
>> Or lese we can add another property in /xyz/openbmc_project/software,
> 
>> name as host id and user can set this property after uploading image.
> 
>> I don’t agree with creating multiple interfaces for single image
>> upgrade. Because image will be deleted after successful activation.
> 
>  [Priyatharshan Response]
> Your suggestion of adding "host id" property is a good idea, but has
> few caveates
> *. If the image is deleted after programming each host, this brings a
> sequential nature where bios upgrade time prolongs as many times in
> multi-host environment (for ex 16-BladeCenter)
> *. the image needs to be copied into the target every time and the
> upgrades needs to be started. The bios.bin file copy causes additional
> delay in the upgradation
> Based on the approach which we porposed,
> *. with the single bios image, multiple host can be upgraded using
> "RequestActivation" in each interface without deleting the bios image
> *. as it is multi object approach (one for each host), multiple host
> could be programmed concurrently
> This would save bios upgrade time.
> 
>  @Vijay Khemka @patrick@stwcx.xyz @Adriana Kobylak: Kindly share your
> thoughts on this.
> 
>  Thanks,
>  Priyatharshan P
> 
> -------------------------
> 
> FROM: Vijay Khemka <vijaykhemka@fb.com>
>  SENT: 16 October 2020 00:58
>  TO: P. Priyatharshan <PriyatharshanP@hcl.com>; Adriana Kobylak
> <anoo@linux.ibm.com>
>  CC: openbmc@lists.ozlabs.org <openbmc@lists.ozlabs.org>;
> anoo@us.ibm.com <anoo@us.ibm.com>; ojayanth@in.ibm.com
> <ojayanth@in.ibm.com>; gmills@linux.vnet.ibm.com
> <gmills@linux.vnet.ibm.com>; Velumani T-ERS,HCLTech
> <velumanit@hcl.com>; ratagupt@linux.vnet.ibm.com
> <ratagupt@linux.vnet.ibm.com>
>  SUBJECT: Re: Multi host bios upgrade support in
> phosphor-bmc-code-mgmt:
> 
> [CAUTION: This Email is from outside the Organization. Unless you
> trust the sender, Don’t click links or open attachments as it may be
> a Phishing email, which can steal your Information and compromise your
> Computer.]
> 
> Can we use extraversion field in manifest file to identify host id.
> 
> In manifest file, if purpose is host then we can check extra version
> 
> and find out which host it is applicable for.
> 
> Or lese we can add another property in /xyz/openbmc_project/software,
> 
> name as host id and user can set this property after uploading image.
> 
> I don’t agree with creating multiple interfaces for single image
> 
> upgrade. Because image will be deleted after successful activation.
> 
> FROM: openbmc <openbmc-bounces+vijaykhemka=fb.com@lists.ozlabs.org> on
> behalf of "P. Priyatharshan" <PriyatharshanP@hcl.com>
>  DATE: Thursday, October 15, 2020 at 10:18 AM
>  TO: Adriana Kobylak <anoo@linux.ibm.com>
>  CC: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
> "anoo@us.ibm.com" <anoo@us.ibm.com>, "ojayanth@in.ibm.com"
> <ojayanth@in.ibm.com>, "gmills@linux.vnet.ibm.com"
> <gmills@linux.vnet.ibm.com>, "Velumani T-ERS, HCLTech"
> <velumanit@hcl.com>, "ratagupt@linux.vnet.ibm.com"
> <ratagupt@linux.vnet.ibm.com>
>  SUBJECT: Re: Multi host bios upgrade support in
> phosphor-bmc-code-mgmt:
> 
> Thanks Adriana for the clarification.
> 
> For host bios update, the images will be copied to BMC(/tmp/images)
> and will start flashing by making RequestedActivation field
> "xyz.openbmc_project.Software.Activation.RequestedActivations.Active".
> In our case, the device location will be same for all the bios images
> (BMC /tmp/images).So I think the above design you proposed[id =
> version+volume ID] may not work effectively for multi host as the id
> is still going to be same for all the hosts.
> 
> We would like to propose the following approach for your review.Kindly
> go through the below steps and share your valuable suggestions.
> 
> 1.Number of host will be identified from machine layer
> [OBMC_HOST_INSTANCES]
> 
> 2.Code will be modified to create n number of objects based on number
> of hosts
> 
>  Ex: Log taken in YosemiteV2 [4 host]
> 
> root@yosemitev2:~# busctl tree
> xyz.openbmc_project.Software.BMC.Updater
> 
> `-/xyz
> 
>  `-/xyz/openbmc_project
> 
>  `-/xyz/openbmc_project/software
> 
>  |-/xyz/openbmc_project/software/1929c585
> 
>  |-/xyz/openbmc_project/software/host1
> 
>  | `-/xyz/openbmc_project/software/host1/28bd62d9
> 
>  |-/xyz/openbmc_project/software/host2
> 
>  | `-/xyz/openbmc_project/software/host2/28bd62d9
> 
>  |-/xyz/openbmc_project/software/host3
> 
>  | `-/xyz/openbmc_project/software/host3/28bd62d9
> 
>  `-/xyz/openbmc_project/software/host4
> 
>  `-/xyz/openbmc_project/software/host4/28bd62d9
> 
> root@yosemitev2:~# busctl tree xyz.openbmc_project.Software.Version
> 
> `-/xyz
> 
>  `-/xyz/openbmc_project
> 
>  `-/xyz/openbmc_project/software
> 
>  |-/xyz/openbmc_project/software/host1
> 
>  | `-/xyz/openbmc_project/software/host1/28bd62d9
> 
>  |-/xyz/openbmc_project/software/host2
> 
>  | `-/xyz/openbmc_project/software/host2/28bd62d9
> 
>  |-/xyz/openbmc_project/software/host3
> 
>  | `-/xyz/openbmc_project/software/host3/28bd62d9
> 
>  `-/xyz/openbmc_project/software/host4
> 
>  `-/xyz/openbmc_project/software/host4/28bd62d9
> 
> 3.This will create activation interface for each host. For a
> multi-host system if the RequestedActivation is set to
> "xyz.openbmc_project.Software.Activation.RequestedActivations.Active",
> then different bios service file will be called based the host.
> 
> For single host : biosServiceFile = "obmc-flash-host-bios@" +
> versionId + ".service";
> 
> For multi host : biosServiceFile = "obmc-flash-host" + host + "-bios@"
> + versionId + ".service";
> 
> Then it can be used for multi host even if the firmware image we want
> to install is the same for multiple host targets.
> 
> I have created a WIP patch for the design proposed above.Kindly have a
> glance and share your comments.
> 
> https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-bmc-code-mgmt/+/37448
> [1]
> 
> Thanks,
> 
> Priyatharshan P
> 
> -------------------------
> 
> FROM: Adriana Kobylak <anoo@linux.ibm.com>
>  SENT: 06 October 2020 03:11
>  TO: P. Priyatharshan <PriyatharshanP@hcl.com>
>  CC: Patrick Williams <patrick@stwcx.xyz>; Velumani T-ERS,HCLTech
> <velumanit@hcl.com>; openbmc@lists.ozlabs.org
> <openbmc@lists.ozlabs.org>; anoo@us.ibm.com <anoo@us.ibm.com>;
> ojayanth@in.ibm.com <ojayanth@in.ibm.com>; gmills@linux.vnet.ibm.com
> <gmills@linux.vnet.ibm.com>; ratagupt@linux.vnet.ibm.com
> <ratagupt@linux.vnet.ibm.com>
>  SUBJECT: Re: Multi host bios upgrade support in
> phosphor-bmc-code-mgmt:
> 
> [CAUTION: This Email is from outside the Organization. Unless you
> trust the sender, Don’t click links or open attachments as it may be
> a Phishing email, which can steal your Information and compromise your
> Computer.]
> 
>  Hi Priyatharshan,
> 
>  > Object : /xyz/openbmc_project/software/[FIRMWARE_VERSION]_[DEVICE]
>  > where device could be host1, 2, ...,N
>  > Interface : xyz.openbmc_project.Software.Activation
>  >
>  > Please confirm if our understanding is correct.
> 
>  I meant that to generate the id, which currently uses the version
>  string, would instead use the version string plus the string for the
>  name of the device where it's stored in order to generate the hash.
> For
>  example, today the code calls "SHA512_Update("version")", where
>  "version" is for example "2.9.0-dev-663-g2e34bb673". Instead the code
>  would detect this version is stored let's say in device "mtd1" or
>  "mmcblk0p1", it'd then append that device string to version, ex:
>  "2.9.0-dev-663-g2e34bb673-mmcblk0p1" and pass that string to
>  SHA512_Update(), therefore creating a different hash depending where
>  that version of bmc code is stored.
> 
>  Note that this is for BMC versions only. We discussed that for host
>  versions, we'd need to modify the code to add a "os-release" file
> under
>  /media/ that contained the host version information similar to the
> BMC's
>  os-release file. In addition, we'd need to somehow determine that
> those
>  files were for host (Bios) versions instead of BMC ones. Perhaps
>  os-release could have an additional field added to specify the
> purpose.
> 
>  > Adriana, Any tentative timeline on your commits availability
> [generate
>  > the id based on firmware version plus the device or volume ]
> 
>  I'd say by early next year at the latest.
> 
> ::DISCLAIMER::
> 
> -------------------------
> 
> The contents of this e-mail and any attachment(s) are confidential and
> intended for the named recipient(s) only. E-mail transmission is not
> guaranteed to be secure or error-free as information could be
> intercepted, corrupted, lost, destroyed, arrive late or incomplete, or
> may contain viruses in transmission. The e mail and its contents (with
> or without referred errors) shall therefore not attach any liability
> on the originator or HCL or its affiliates. Views or opinions, if any,
> presented in this email are solely those of the author and may not
> necessarily reflect the views or opinions of HCL or its affiliates.
> Any form of reproduction, dissemination, copying, disclosure,
> modification, distribution and / or publication of this message
> without the prior written consent of authorized representative of HCL
> is strictly prohibited. If you have received this email in error
> please delete it and notify the sender immediately. Before opening any
> email and/or attachments, please check them for viruses and other
> defects.
> 
> -------------------------
> 
> 
> Links:
> ------
> [1]
> https://apc01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgerrit.openbmc-project.xyz%2Fc%2Fopenbmc%2Fphosphor-bmc-code-mgmt%2F%2B%2F37448&amp;data=04%7C01%7CPriyatharshanP%40hcl.com%7C360bd4e12c3f4766c18708d87140813c%7C189de737c93a4f5a8b686f4ca9941912%7C0%7C0%7C637383869156208822%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=mCKg9YzRECFzIbB0Mp78FH6r5SbSXzWs2HZG4RSHo%2Bs%3D&amp;reserved=0
