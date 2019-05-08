Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D52517DB5
	for <lists+openbmc@lfdr.de>; Wed,  8 May 2019 18:07:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44zhFz0ZtKzDqG6
	for <lists+openbmc@lfdr.de>; Thu,  9 May 2019 02:07:51 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=anoo@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44zhF63DcdzDqFs
 for <openbmc@lists.ozlabs.org>; Thu,  9 May 2019 02:07:05 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x48G4CfC005221
 for <openbmc@lists.ozlabs.org>; Wed, 8 May 2019 12:07:01 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2sc0kfpeya-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 08 May 2019 12:07:01 -0400
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@linux.ibm.com>;
 Wed, 8 May 2019 17:07:00 +0100
Received: from b01cxnp22033.gho.pok.ibm.com (9.57.198.23)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 8 May 2019 17:06:58 +0100
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x48G6vRo33816646
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 8 May 2019 16:06:57 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B726B112066;
 Wed,  8 May 2019 16:06:57 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 49B74112061;
 Wed,  8 May 2019 16:06:57 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  8 May 2019 16:06:57 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 08 May 2019 11:09:10 -0500
From: Adriana Kobylak <anoo@linux.ibm.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH] ARM: dts: aspeed: Add Swift BMC machine
In-Reply-To: <CACPK8Xe+Xgj-S8Kgy=pTkJ8ftkVKivuRpQy3bMYqOka7xj00ag@mail.gmail.com>
References: <1551820067-53510-1-git-send-email-anoo@linux.ibm.com>
 <02b66794-19bf-a042-66a9-00fc712355f5@linux.ibm.com>
 <CACPK8Xez-iKZ9h7NB9YX+AfNFtoZhsP9Ap8H+1w-cvmAk1S5xQ@mail.gmail.com>
 <e97fb72d9253a582404c704d743bedb6@linux.vnet.ibm.com>
 <CACPK8Xe+Xgj-S8Kgy=pTkJ8ftkVKivuRpQy3bMYqOka7xj00ag@mail.gmail.com>
X-Sender: anoo@linux.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 19050816-0040-0000-0000-000004ECDC80
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011071; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000285; SDB=6.01200416; UDB=6.00629851; IPR=6.00981302; 
 MB=3.00026794; MTD=3.00000008; XFM=3.00000015; UTC=2019-05-08 16:06:59
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19050816-0041-0000-0000-000008F8E602
Message-Id: <21963d836d45765916da1816457f18ad@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-08_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905080099
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Matt Spinler <mspinler@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 2019-05-07 17:57, Joel Stanley wrote:
> On Tue, 2 Apr 2019 at 21:02, Adriana Kobylak <anoo@linux.ibm.com> 
> wrote:
>> 
>> On 2019-03-27 01:18, Joel Stanley wrote:
>> > Hi Adriana,
>> >
>> >
>> > Are you going to send a v2 that address Matt's comment?
>> >
>> 
>> Yeah, I wanted to wait to get a consensus on the flash layout for this
>> system to not have to send a separate patch for it, which seems will
>> happen this week, will send a v2 addressing the comments and removing
>> the TODO to update the flash layout once I get that information.
> 
> ping?

Hi Joel, if you could review v4, seems we're ready to go, got a 
Reviewed-By from Matt for v3, and addressed a new comment from Brandon 
on v4, thanks! - https://patchwork.ozlabs.org/patch/1096042/

