Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9609628423C
	for <lists+openbmc@lfdr.de>; Mon,  5 Oct 2020 23:42:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C4vG74z8dzDqP1
	for <lists+openbmc@lfdr.de>; Tue,  6 Oct 2020 08:42:39 +1100 (AEDT)
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
 header.s=pp1 header.b=iWGgPDOo; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C4vDh0Z8VzDqMr
 for <openbmc@lists.ozlabs.org>; Tue,  6 Oct 2020 08:41:22 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 095LYwgh071064; Mon, 5 Oct 2020 17:41:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=mime-version :
 content-type : content-transfer-encoding : date : from : to : cc : subject
 : in-reply-to : references : message-id; s=pp1;
 bh=YVXrYj9tlyG2o7Xs9yu7VXzlDYBJc87GS1y+R09zwdw=;
 b=iWGgPDOoNuVTP929EY2Do6pCmWQsHH1NMOZpFrwPAYufq5tlHH2UjOjsY22dNZD7d+Vy
 0PcaDfj55a40meglNHq+maiuEMrd5Z7EiE0wyjXnfXnBcoTXFSMaqNA2t2u2AgZIpLbm
 u2Ra2LHkO7IOQBqXe82nvy+YSizmF8PYAKF9pjP/p15nbbw7Avkddpw7PBDAyP0SopFN
 xEc2f2DHJSQD26qOQzwp/D6Aoqz2NFfEX7HGbfyJmxkdZrlvgAjltAVbLaQcuxH7rwN8
 QmvhEPIepO/PYlJkunqzcbhXHtHM1uPKMlZCLBRAJaHvDpkHHQuywq90GzQVMeEFXMdQ AQ== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 340aub95j9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 Oct 2020 17:41:16 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 095LWYDO004692;
 Mon, 5 Oct 2020 21:41:15 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma05wdc.us.ibm.com with ESMTP id 33xgx8tmvc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 Oct 2020 21:41:15 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 095LfDir39715086
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 5 Oct 2020 21:41:13 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BABB9AC059;
 Mon,  5 Oct 2020 21:41:13 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 038E8AC05E;
 Mon,  5 Oct 2020 21:41:12 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  5 Oct 2020 21:41:12 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 05 Oct 2020 16:41:12 -0500
From: Adriana Kobylak <anoo@linux.ibm.com>
To: "P. Priyatharshan" <PriyatharshanP@hcl.com>
Subject: Re: Multi host bios upgrade support in phosphor-bmc-code-mgmt:
In-Reply-To: <TY2PR04MB3311812DB85A11934F044FB4CA0C0@TY2PR04MB3311.apcprd04.prod.outlook.com>
References: <TY2PR04MB33112E61CA54FE1A17D30B70CA3A0@TY2PR04MB3311.apcprd04.prod.outlook.com>
 <20200921194614.GL6152@heinlein>,
 <b6cd8ac0b56a372391bd108dbf84fb0f@linux.vnet.ibm.com>,
 <TY2PR04MB33117717F809C0804A00B365CA300@TY2PR04MB3311.apcprd04.prod.outlook.com>
 <TY2PR04MB3311812DB85A11934F044FB4CA0C0@TY2PR04MB3311.apcprd04.prod.outlook.com>
Message-ID: <893bbe2bbfe35c6ccdea0988c8ec1de9@linux.vnet.ibm.com>
X-Sender: anoo@linux.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-05_16:2020-10-05,
 2020-10-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015
 bulkscore=0 phishscore=0 mlxlogscore=999 spamscore=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2010050153
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
 ratagupt@linux.vnet.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Priyatharshan,

>  Object : /xyz/openbmc_project/software/[FIRMWARE_VERSION]_[DEVICE]
> where device could be host1, 2, ...,N
>  Interface : xyz.openbmc_project.Software.Activation
> 
>  Please confirm if our understanding is correct.

I meant that to generate the id, which currently uses the version 
string, would instead use the version string plus the string for the 
name of the device where it's stored in order to generate the hash. For 
example, today the code calls "SHA512_Update("version")", where 
"version" is for example "2.9.0-dev-663-g2e34bb673". Instead the code 
would detect this version is stored let's say in device "mtd1" or 
"mmcblk0p1", it'd then append that device string to version, ex: 
"2.9.0-dev-663-g2e34bb673-mmcblk0p1" and pass that string to 
SHA512_Update(), therefore creating a different hash depending where 
that version of bmc code is stored.

Note that this is for BMC versions only. We discussed that for host 
versions, we'd need to modify the code to add a "os-release" file under 
/media/ that contained the host version information similar to the BMC's 
os-release file. In addition, we'd need to somehow determine that those 
files were for host (Bios) versions instead of BMC ones. Perhaps 
os-release could have an additional field added to specify the purpose.


> Adriana, Any tentative timeline on your commits availability [generate
> the id based on firmware version plus the device or volume ]

I'd say by early next year at the latest.
