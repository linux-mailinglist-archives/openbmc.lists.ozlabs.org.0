Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7565510E64
	for <lists+openbmc@lfdr.de>; Wed,  1 May 2019 23:11:00 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44vWJy01FYzDqNd
	for <lists+openbmc@lfdr.de>; Thu,  2 May 2019 07:10:58 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=zshelle@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44vWJ11hb2zDqNJ
 for <openbmc@lists.ozlabs.org>; Thu,  2 May 2019 07:10:08 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x41L8uSt059067
 for <openbmc@lists.ozlabs.org>; Wed, 1 May 2019 17:10:05 -0400
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2s7jaj1en5-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 01 May 2019 17:10:05 -0400
Received: from localhost
 by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <zshelle@linux.ibm.com>;
 Wed, 1 May 2019 22:10:05 +0100
Received: from b01cxnp22036.gho.pok.ibm.com (9.57.198.26)
 by e11.ny.us.ibm.com (146.89.104.198) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 1 May 2019 22:10:02 +0100
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x41LA11K30277780
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 1 May 2019 21:10:01 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9DA88112062
 for <openbmc@lists.ozlabs.org>; Wed,  1 May 2019 21:10:01 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 628BC112061
 for <openbmc@lists.ozlabs.org>; Wed,  1 May 2019 21:10:01 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP
 for <openbmc@lists.ozlabs.org>; Wed,  1 May 2019 21:10:01 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 01 May 2019 16:11:57 -0500
From: Zane Shelley <zshelle@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: Re: meson issue in romulus SDK
Organization: IBM
In-Reply-To: <20190501203927.bwkmxeuvuq4ytgnk@thinkpad.dyn.fuzziesquirrel.com>
References: <57aa38106d2f0c5e0a08eafa8a219aef@linux.vnet.ibm.com>
 <20190501203927.bwkmxeuvuq4ytgnk@thinkpad.dyn.fuzziesquirrel.com>
X-Sender: zshelle@linux.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 19050121-2213-0000-0000-00000384F02E
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011031; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000285; SDB=6.01197193; UDB=6.00627898; IPR=6.00978046; 
 MB=3.00026688; MTD=3.00000008; XFM=3.00000015; UTC=2019-05-01 21:10:03
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19050121-2214-0000-0000-00005E403AB5
Message-Id: <fcfcd5e85b85e57f827de31b0389c7e8@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-01_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=743 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905010131
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

On 2019-05-01 15:39, Brad Bishop wrote:
> On Wed, May 01, 2019 at 10:40:35AM -0500, Zane Shelley wrote:
>> I'm just getting into meson. The manual for meson at mesonbuild.com 
>> indicates the command syntax is 'meson [command] [arguments] 
>> [options]', which is consistent with the version of meson I have 
>> installed on Ubuntu 18.04 ('meson -v' returns 0.45.1). However, when I 
>> source the romulus SDK that I built this morning ('meson -v' returns 
>> 0.49.2), it doesn't understand the [command] argument. For example:
>> 
>> $ meson init
>> 
>> ERROR: Neither directory contains a build file meson.build.
>> $ ls
>> init
>> 
>> I think this version of meson tried to build what is in ./ and put it 
>> in init/. Could anyone explain why this behavior is different?
>> 
>> -- - Zane
> 
> Hi Zane
> 
> For getting your feet wet with OpenBMC + meson could you forgo the SDK
> and cross compiling and use the docker CI environment?...SDK support 
> for
> meson is missing a few minor things right now.  Are you able to install
> docker somewhere?  Then you can do something like this:
> 
> export WORKSPACE=/home/andrewg/Code/ && \    export
> UNIT_TEST_PKG=obmc-ikvm && \
> ./openbmc-build-scripts/run-unit-test-docker.sh
> 
> thx - brad

Thanks, I will check it out.

-- 
- Zane

