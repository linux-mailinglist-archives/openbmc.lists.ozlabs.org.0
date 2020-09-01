Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6B6258EB8
	for <lists+openbmc@lfdr.de>; Tue,  1 Sep 2020 14:55:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bgn9t0SybzDqWG
	for <lists+openbmc@lfdr.de>; Tue,  1 Sep 2020 22:55:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tomjose@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=pwaTqE1o; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bgn7j0PtCzDqVl
 for <openbmc@lists.ozlabs.org>; Tue,  1 Sep 2020 22:53:52 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 081CWkVK177117; Tue, 1 Sep 2020 08:53:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=O2tbumbJB24/W3aZoqEXUrAiyRzJP+mR+l6hl96mgkQ=;
 b=pwaTqE1o4c30jKJqx6zlisVmivh/I5gjEqPhxiZ8PXV3yACueIW3MJworgThGrcgSCaG
 hQFB1DDZCiTvXq0t8gMlpuW5m27hGXupqunhKv1899ilRCiVhDAH5aj9sFC3JagbLlBK
 qGTEaz/7ILUBxGTekWmpuAH9eP9TFmnkT478ZPZJVaBrtMiPSz4mgvtM7ASusdvCtj/I
 Pt94ugywPpks/T8qhNdIjPvVUq6DVCydSvNSd561keAN3Y8Ij52OcC3pS9eq/5+Rqv0b
 ihq0mDrLtKLAe1kILPjKAJrdLP5nzKBzCz7EaCleLhOiOha58uG3dpynJ+ihb9u6Gjo0 gQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 339n80auh7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Sep 2020 08:53:45 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 081CWxns178305;
 Tue, 1 Sep 2020 08:53:44 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com with ESMTP id 339n80augt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Sep 2020 08:53:44 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 081CqTb8031133;
 Tue, 1 Sep 2020 12:53:43 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma02fra.de.ibm.com with ESMTP id 337en7j3u8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Sep 2020 12:53:42 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 081Cq9iE62325046
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Sep 2020 12:52:09 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 74CBB52059;
 Tue,  1 Sep 2020 12:53:40 +0000 (GMT)
Received: from [9.85.70.94] (unknown [9.85.70.94])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id 327795204E;
 Tue,  1 Sep 2020 12:53:38 +0000 (GMT)
Subject: Re: IPMI implementation of Get Device ID command
To: Patrick Williams <patrick@stwcx.xyz>
References: <ff39e855-d5b6-a789-bcbb-3b87bf786bd1@linux.vnet.ibm.com>
 <20200814231020.GA16853@mauery.jf.intel.com>
 <4cde2763-88b0-447b-1aba-5bb884fae251@linux.vnet.ibm.com>
 <20200824212702.GD3532@heinlein>
From: TOM JOSEPH <tomjose@linux.vnet.ibm.com>
Message-ID: <a5114308-309d-3c66-adb3-3da4e35b1b7b@linux.vnet.ibm.com>
Date: Tue, 1 Sep 2020 18:23:36 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200824212702.GD3532@heinlein>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-01_08:2020-09-01,
 2020-09-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 bulkscore=0 mlxlogscore=999 clxscore=1015 spamscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009010109
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
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, anoo@us.ibm.com,
 benjaminfair@google.com, "Mauery, Vernon" <vernon.mauery@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello Patrick,

For translating IBM firmware revision to IPMI firmware version, the plan 
is to continue using VERSION_ID in os-release. This translation is 
obsolete 
(https://github.com/openbmc/openbmc/blob/master/meta-ibm/recipes-phosphor/ipmi/phosphor-ipmi-config.bbappend), 
but I will update this to handle the major and minor firmware revision. 
I will work on pushing a patch for that.

Regards,
Tom

On 25-08-2020 02:57, Patrick Williams wrote:
> On Mon, Aug 24, 2020 at 05:27:55PM +0530, TOM JOSEPH wrote:
>> My proposal is to add major and minor version to the dev_id.json and
>> this can be populated in the meta-xxx layer (something like this
>> https://github.com/openbmc/openbmc/blob/master/meta-ibm/recipes-phosphor/ipmi/phosphor-ipmi-config.bbappend).
>> If the format of the VERSION_ID does not match the master tag format,
>> then major and minor version will be picked from the dev_id.json. With
>> this approach every company can share the upstream implementation of the
>> command. Thoughts?
> Hi Tom,
>
> Would you be able to work out an example where the git-describe is used
> to create this, similar to what we do with os-release?  I think this is
> going to be the typical use case and we had a huge trouble getting
> os-release to be done "correctly" at the beginning.  I think having a
> well-tested example to copy from should limit the issues others will
> have in trying to implement their own.
>
