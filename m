Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF2969F76
	for <lists+openbmc@lfdr.de>; Tue, 16 Jul 2019 01:19:40 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45nfcn3yB7zDqTk
	for <lists+openbmc@lfdr.de>; Tue, 16 Jul 2019 09:19:37 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=jrey@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45nfcF60dwzDqTg
 for <openbmc@lists.ozlabs.org>; Tue, 16 Jul 2019 09:19:09 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6FNGnG6041766
 for <openbmc@lists.ozlabs.org>; Mon, 15 Jul 2019 19:19:06 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2try7r0kdn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 15 Jul 2019 19:19:05 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x6FNIFCV055291
 for <openbmc@lists.ozlabs.org>; Mon, 15 Jul 2019 19:19:05 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2try7r0kdb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jul 2019 19:19:05 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x6FNF644019898;
 Mon, 15 Jul 2019 23:19:04 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma04dal.us.ibm.com with ESMTP id 2trtmqu156-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jul 2019 23:19:04 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6FNJ3Zf8782482
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Jul 2019 23:19:03 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D2C3628066;
 Mon, 15 Jul 2019 23:19:03 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AAD3528059;
 Mon, 15 Jul 2019 23:19:03 +0000 (GMT)
Received: from demeter.rchland.ibm.com (unknown [9.10.254.219])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTPS;
 Mon, 15 Jul 2019 23:19:03 +0000 (GMT)
Subject: Re: 2.7 Release: Freeze Week - security items for 2.7
To: krtaylor <kurt.r.taylor@gmail.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <2061b2a4-5308-0d65-ad52-4a4ad4dbaca5@gmail.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <dd9a4959-ac31-4e80-a753-7a1c49564e42@linux.ibm.com>
Date: Mon, 15 Jul 2019 18:19:03 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <2061b2a4-5308-0d65-ad52-4a4ad4dbaca5@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-15_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907150260
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


On 7/8/19 2:00 PM, krtaylor wrote:
> Soon we will branch a 2.7 release candidate. <UPDATE: done, see email 
> from Brad> Here are some things to prepare for:
>
> 1) Start testing the release candidate as soon as possible - please 
> post results to IRC or email, openly discuss any problems that you 
> find on your system.
>
> 2) Clean up documentation, bring old docs current, add documentation 
> for new functionality.
>
> 3) Send me any input for release notes that did not make it in a 
> release feature (github issue)

My comments below are not meant as release note candidates.  Perhaps 
they could be further summarized and merged with input from other emails.

>
> 4)Bug cleanup/feature (issue) cleanup, add comments, indicate state - 
> if something didn't make it in the release, please let me know first 
> and/or come to a release planning meeting and we'll take care of it.

I have one config change and two test cases in my notes below.

>
> 5) Master will not be frozen, so new functionality can continue to 
> make progress, but please take some time in the next couple of weeks 
> to test or contribute docs, etc
>
> Remember: communicate outside your organization MUCH more than you 
> think you need to - use IRC, send email, share what you are doing and 
> where you are with it!

Here are some of the interesting security developments from the OpenBMC 
2.7 timeframe (1/2019 to 7/2019):
- BMCWeb became the default HTTP and Web server in the meta-ibm layer.  
It replaced the nginx server.
- The phosphor-user-manager interface unified REST API and IPMI 
authentication and user management.
- BMCWeb changed to accept the Mozilla Modern transport layer security 
(TLS) ciphers.
- BMCWeb improved the security of HTTP response headers it sends.
- The SSH server (dropbear) removed some less-secure transport layer 
security (TLS) ciphers.  These changes are needed to achieve parity with 
the 2.6 release, (and the change go beyond that).  The change was 
adopted by Yocto and is in openbmc master, but did not make it into the 
2.7 release; the fix is pending.
- Note that due to the TLS cipher changes, older web and ssh clients may 
no longer be able to connect.  Modern supported clients should be able 
to connect.
- Added certificate management functions to Redfish: upload, and 
generate via Certificate Signing Requests (CSR).  Some of these 
functions are being debugged.
- Added support for LDAP.
- Added support for virtual media.
- Added support for IP-KVM.
- Added API to change the IPMI root user password.
- An API to reset BMC authentication was replaced with factory reset, in 
the openpower layer.
- Added security test cases for SSH and Redfish interfaces.
- Closed interfaces affected by CVE 2019-6260 (ASPEED BMC interfaces).  
I believe this is not yet integrated into the test suite.
- Addressed webpack-dev-server security in response to CVE 2018-14732.
- Added a network security considerations guide.

- Joseph

>
> Happy 2.7 release month!
> Kurt Taylor (krtaylor)
>

