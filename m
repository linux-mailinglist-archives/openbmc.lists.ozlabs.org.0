Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9731C9717
	for <lists+openbmc@lfdr.de>; Thu,  7 May 2020 19:06:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49J0H06QbGzDqRh
	for <lists+openbmc@lfdr.de>; Fri,  8 May 2020 03:06:20 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49J01m6sjLzDqcT
 for <openbmc@lists.ozlabs.org>; Fri,  8 May 2020 02:54:52 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 047GZbSJ072586; Thu, 7 May 2020 12:54:44 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30s2g5h56y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 May 2020 12:54:44 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 047GoKI5022396;
 Thu, 7 May 2020 16:54:43 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma03wdc.us.ibm.com with ESMTP id 30s0g7bbch-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 May 2020 16:54:43 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 047GsheS49348970
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 7 May 2020 16:54:43 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 030E1124055;
 Thu,  7 May 2020 16:54:43 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 83276124053;
 Thu,  7 May 2020 16:54:42 +0000 (GMT)
Received: from demeter.roc.mn.charter.com (unknown [9.85.153.254])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTPS;
 Thu,  7 May 2020 16:54:42 +0000 (GMT)
Subject: Re: openssl upgrade CVE-2020-1967
To: "chunhui.jia" <chunhui.jia@linux.intel.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
References: <959CAFA1E282D14FB901BE9A7BF4E7724E52C8BD@shsmsx102.ccr.corp.intel.com>
 <FAD2D9A0-A730-4A28-9798-0B8B3228E14F@fuzziesquirrel.com>
 <5EB3BC15.60402@linux.intel.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <691f8cf6-f448-5df3-8200-8ee864f78bc7@linux.ibm.com>
Date: Thu, 7 May 2020 11:54:41 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <5EB3BC15.60402@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-07_10:2020-05-07,
 2020-05-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 mlxlogscore=999 clxscore=1011
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2005070125
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
Cc: "Bills, Jason M" <jason.m.bills@linux.intel.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 5/7/20 2:43 AM, chunhui.jia wrote:
> Brad,
> There is a CVE reported in openSSL 1.1.1d (used by current openbmc).  
> Severity is high.
>
> CVE-2020-1967 <https://nvd.nist.gov/vuln/detail/CVE-2020-1967> 
> https://nvd.nist.gov/vuln/detail/CVE-2020-1967
> Server or client applications that call the SSL_check_chain() function 
> during or after a TLS 1.3 handshake may crash due to a NULL pointer 
> dereference as a result of incorrect handling of the 
> "signature_algorithms_cert" TLS extension. The crash occurs if an 
> invalid or unrecognised signature algorithm is received from the peer. 
> This could be exploited by a malicious peer in a Denial of Service 
> attack. OpenSSL version 1.1.1d, 1.1.1e, and 1.1.1f are affected by 
> this issue. This issue did not affect OpenSSL versions prior to 
> 1.1.1d. Fixed in OpenSSL 1.1.1g (Affected 1.1.1d-1.1.1f).
>

Thanks for reporting this.  According to OpenBMC network security 
considerations [1], SSL (and specifically OpenSSL) is used in two 
places: the dropbear SSH server [2] and the BMCWeb HTTPS server [3].   I 
don't see any references to the defective function (SSL_check_chain) in 
those code bases or in any other OpenBMC code. I've CC'd the BMCWeb 
maintainers to help check this.  If that is all true, the OpenBMC is not 
affected.

I believe Brad plans to update OpenBMC to the Yocto Dunfell 3.1 release 
[4] which does use OpenSSL 1.1.1g [5].

- Joseph

[1]: 
https://github.com/openbmc/docs/blob/master/security/network-security-considerations.md
[2]: https://github.com/mkj/dropbear
[3]: https://github.com/openbmc/bmcweb
[4]: https://wiki.yoctoproject.org/wiki/Releases
[5]: 
https://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-connectivity/openssl?h=dunfell

> It is fixed in 1.1.1g.  Upstream recipe already point openssl to 
> latest version (1.1.1g).
> https://git.yoctoproject.org/cgit.cgi/poky/plain/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb
> Will you update poky subtree to latest?

