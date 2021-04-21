Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D40EF366374
	for <lists+openbmc@lfdr.de>; Wed, 21 Apr 2021 03:50:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQ3RX5dhZz2yxL
	for <lists+openbmc@lfdr.de>; Wed, 21 Apr 2021 11:50:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LLqh7ipL;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=LLqh7ipL; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQ3RG2tRBz2xZj
 for <openbmc@lists.ozlabs.org>; Wed, 21 Apr 2021 11:50:33 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13L1Y6CL098686; Tue, 20 Apr 2021 21:50:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=sQajHCTm3YXEg3ylAXXY/ZZmiaeG5Zo04UFcMJO152M=;
 b=LLqh7ipLmJqC5aF7HKJKOwE3j+ld4oJyqtHL6wtsbj9/mi8/Sep/MP/WFHKHGu+bdcfJ
 DFZFNr7QShRkUFW+NACZfhoM8W08TJy9LW3HIPVRZKjVbVx+lzegDyphSb7KTci9wSy5
 3+v9afJps3ko4wMKQyfOUpSCJEUq27Kw4TxBlqrEl2I/dToVH9wSMcilI/4KxyViZOHn
 p54/S9Ll/JefNB8wWFtUSdyn3Rj43bFlQJ7E3Rj9k296i2W7KPrzhTU+NmLAO6FagjXY
 T6yyAujcY/dIadyIs8YcBXZZkzyIsNgs3Avqv+2RewmIQa5Gok/INL33lq9qSKOWZN7a og== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3820868b72-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Apr 2021 21:50:30 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13L1gonB003074;
 Wed, 21 Apr 2021 01:50:29 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma05wdc.us.ibm.com with ESMTP id 37yqa96hb7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Apr 2021 01:50:29 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13L1oS7s28836218
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Apr 2021 01:50:28 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A682BC6063;
 Wed, 21 Apr 2021 01:50:28 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2B6A2C6059;
 Wed, 21 Apr 2021 01:50:28 +0000 (GMT)
Received: from demeter.local (unknown [9.160.109.56])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Wed, 21 Apr 2021 01:50:27 +0000 (GMT)
Subject: Re: What is OpenBMC server software
To: Thang Nguyen OS <thang@os.amperecomputing.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <843031a3-072a-a3f7-b2c4-17a5406c4daf@os.amperecomputing.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <a14798b2-5906-f770-cf45-13ff916e125c@linux.ibm.com>
Date: Tue, 20 Apr 2021 20:50:26 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
In-Reply-To: <843031a3-072a-a3f7-b2c4-17a5406c4daf@os.amperecomputing.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ssrt1TbK7Tt_rKPdDqRHbk-0BWJRRwUB
X-Proofpoint-ORIG-GUID: ssrt1TbK7Tt_rKPdDqRHbk-0BWJRRwUB
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-20_11:2021-04-20,
 2021-04-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 clxscore=1011 phishscore=0 adultscore=0 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104210011
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



On 4/17/21 3:27 AM, Thang Nguyen OS wrote:
> Hi,
>
> The Mozilla firefox SSL configuration, https://ssl-config.mozilla.org, 
> provide suggestion for Web server software to use secure config by 
> selecting the right Web server software, version and OpenSSL version.
>
> However, I can't find what Web server software and version that 
> OpenBMC is using. How can I find the information and check if OpenBMC 
> is using the best secure configuration?

Thang,

I had the same questions a while ago: When given a specific version of 
OpenBMC, how do I know which versions of open source packages are pulled 
in?  This is useful for both license compliance and to understand if 
specific vulnerabilities are in your code.  I think I have some partial 
answers.

Note that OpenBMC releases are shown here 
https://github.com/openbmc/openbmc/wiki/Releases
but OpenBMC versions are often identified by a git commit.  You can find 
the OpenBMC version like this:
- If you are in your source tree, `git log -1` will show the commit number.
- If you have access to the BMC's file system, see file /etc/os-release.

The bitbake build process can produce license information; this also has 
the exact source package versions used.  For example, it can reliably 
tell you which version of OpenSSL your build used.  For details, refer 
to the Yocto project `license.bbclass` and the Yocto project development 
manual section titled "Maintaining Open Source License Compliance During 
Your Product's Lifecycle".  I believe OpenBMC produces this data by 
default, which means the build process writes license manifest data to 
files under build/tmp/deploy/licenses/{your-image-name}/.

If you are interested in how the source package versions are configured 
in the OpenBMC source tree, you need to study the Yocto documentation.  
Here are some specifics for component parts of an OpenBMC image 
including the Linux kernel and OpenSSL:
1. You can find the Linux kernel version from your source, like this: 
https://github.com/openbmc/openbmc/blob/master/meta-aspeed/recipes-kernel/linux/linux-aspeed_git.bb
2. You can find the OpenSSL recipe under: 
https://github.com/openbmc/openbmc/tree/master/poky/meta/recipes-connectivity/openssl

You can find OpenBMC's SSL transport layer security configurations here:
  - For the Web/REST API server SSL configuration, see hard-coded values 
here: 
https://github.com/openbmc/bmcweb/blob/master/include/ssl_key_handler.hpp
  - For the SSH server SSL configuration (if using the dropbear server), 
see compile time options here: 
https://github.com/openbmc/openbmc/blob/master/meta-phosphor/recipes-core/dropbear/dropbear/options.patch


Finally, I've added this explanation to the OpenBMC project 
configuration guide:
https://github.com/openbmc/openbmc/wiki/Configuration-guide

Thanks for asking!
- Joseph

>
> Best Regards,
>
> Thang Q. Nguyen -
>

