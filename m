Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C25B82AC609
	for <lists+openbmc@lfdr.de>; Mon,  9 Nov 2020 21:36:15 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CVN7H3zzrzDqVn
	for <lists+openbmc@lfdr.de>; Tue, 10 Nov 2020 07:36:11 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=anoo@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=XYMgxZAU; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CVN6R2DYFzDqSs
 for <openbmc@lists.ozlabs.org>; Tue, 10 Nov 2020 07:35:25 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A9KX72t004403; Mon, 9 Nov 2020 15:35:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=mime-version : date :
 from : to : cc : subject : in-reply-to : references : message-id :
 content-type : content-transfer-encoding; s=pp1;
 bh=eROCupqTrvCQzai5OWuS5v8b7QjEn1UIVwnHSx96GKU=;
 b=XYMgxZAUS0/Al4pQyq09TAI30wFdaE+3709fRZ/zsakl0w7ij5wiW1aX8KK75ECYfeHc
 sHE/eqjDiksM/oxbsYE4ISbE2IWTAQ17OrVPYkfgIf5iZorld5RLmylt5i/62cd14Nmh
 sNp1btlPsWJaDQEkmAsUhJ8Brb0zSRTIksZ71F9KmV0H1t8fqZLDuCxs1vVfsR+sWhE5
 b3V92nm1jta3ENG0SGySXO6qGv4nl+XROmFK+uaODOfYuCeFBJUwo2THE8+VzlNVtca2
 zsoMnMdlNhV0h0xqcjKC+LF1KY+BOD0XqROSYRD4ASrd2K5ouZOhtSufJbuHML0xE3DT ag== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34qa2nx058-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Nov 2020 15:35:17 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0A9KVkuL012435;
 Mon, 9 Nov 2020 20:35:17 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma02dal.us.ibm.com with ESMTP id 34nk797sv5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Nov 2020 20:35:17 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0A9KZ8wX8716802
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Nov 2020 20:35:08 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 219A5C6062;
 Mon,  9 Nov 2020 20:35:14 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CD168C6055;
 Mon,  9 Nov 2020 20:35:13 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  9 Nov 2020 20:35:13 +0000 (GMT)
MIME-Version: 1.0
Date: Mon, 09 Nov 2020 14:35:13 -0600
From: Adriana Kobylak <anoo@linux.ibm.com>
To: Patrick Williams <patrick@stwcx.xyz>
Subject: Re: Multi host bios upgrade support in phosphor-bmc-code-mgmt:
In-Reply-To: <20201103210149.GB38269@patrickw3-mbp.lan.stwcx.xyz>
References: <893bbe2bbfe35c6ccdea0988c8ec1de9@linux.vnet.ibm.com>
 <SL2PR04MB330696831B49B81F75168538CA020@SL2PR04MB3306.apcprd04.prod.outlook.com>
 <8EF4ECDB-2EA4-4620-B7EE-FBB899FD1C47@fb.com>
 <TY2PR04MB33110CD5532EF9CE5F3FD949CA1E0@TY2PR04MB3311.apcprd04.prod.outlook.com>
 <ce091343af20328a24f1b1f02fca3ec4@linux.vnet.ibm.com>
 <219FD10A-97C2-4876-94B0-23D548A6D7B6@fb.com>
 <TY2PR04MB3311F9B0C300A1CB363C2E67CA1C0@TY2PR04MB3311.apcprd04.prod.outlook.com>
 <TY2PR04MB3311EF16B27EFE8683C8B818CA1A0@TY2PR04MB3311.apcprd04.prod.outlook.com>
 <TY2PR04MB33113E97FD6130E8FE8FBEA8CA170@TY2PR04MB3311.apcprd04.prod.outlook.com>
 <cb26521dbead9fd84e3b8863682291f5@linux.vnet.ibm.com>
 <20201103210149.GB38269@patrickw3-mbp.lan.stwcx.xyz>
Message-ID: <4c2b7022e3ac7f82849efd2c92db3e4f@linux.vnet.ibm.com>
X-Sender: anoo@linux.ibm.com
User-Agent: Roundcube Webmail/1.0.1
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-09_12:2020-11-05,
 2020-11-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=725
 mlxscore=0 phishscore=0 clxscore=1015 spamscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011090133
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
Cc: "P. Priyatharshan" <PriyatharshanP@hcl.com>, openbmc@lists.ozlabs.org,
 anoo@us.ibm.com, ojayanth@in.ibm.com, gmills@linux.vnet.ibm.com,
 "Velumani T-ERS, HCLTech" <velumanit@hcl.com>,
 Vijay Khemka <vijaykhemka@fb.com>, ratagupt@linux.vnet.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 2020-11-03 15:01, Patrick Williams wrote:
> On Fri, Oct 30, 2020 at 01:52:32PM -0500, Adriana Kobylak wrote:
>> I'd suggest filling up a design document template[1].
> 
> Agreed.  I tried looking back at the discussion and I'm not sure what
> the remaining open issues are here to give additional feedback on.  A
> design proposal and summary of the outstanding questions would help
> give direction to where we still need solutions before you can proceed.
> 
> Feel free to spell out "Open Issues: ..." right in a design proposal 
> and
> we can work through that in review or defer back to the mailing list 
> for
> discussion on the specifics.

For anyone interested, design doc: 
https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/37950
