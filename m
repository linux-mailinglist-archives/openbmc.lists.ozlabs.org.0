Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6303FCFD4
	for <lists+openbmc@lfdr.de>; Wed,  1 Sep 2021 01:14:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gzjgx1gjxz2yJd
	for <lists+openbmc@lfdr.de>; Wed,  1 Sep 2021 09:14:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dik9mwkQ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=dik9mwkQ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GzjgV6RQwz2xXZ
 for <openbmc@lists.ozlabs.org>; Wed,  1 Sep 2021 09:14:13 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17VN2Ytw110991; Tue, 31 Aug 2021 19:14:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=gGRCp3Bt73aCsDwaVH23eQWviTFuNj9r7t17vX1djmg=;
 b=dik9mwkQnlFb8EnqQpi9mOkoGf1Tf7hKaWTt30dnpzXletduXE86d9VhpMLPMKtqkcZg
 BJCDxxTzCC9N/1Be4BP6R0iesuk1X0VIgGb3TUtE2dtvCAFvanFs3QQLZsgAE+yvtYwh
 NAP0GowVzOf1OUiEgFJURmM4jPeiTVf/qwr0lkblmXVrrQC7P3XEloy+wXOEb3J2w/s+
 q9BL9m7UlHTH/upREHxUY6QS37TgWO9zV96IMZ3mxDYN3zlz0m1zaob2WCG1LDlDVI/d
 dck4SKqO6N/0WH/5bqCFfNrkSno4WI4yjg4pNxiwMdaWxKNNZg7pP2M84+yScre2pGCF BA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3aswpw89xd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 31 Aug 2021 19:14:09 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17VN2ui5112280;
 Tue, 31 Aug 2021 19:14:09 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3aswpw89x5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 31 Aug 2021 19:14:09 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17VN8dCQ016933;
 Tue, 31 Aug 2021 23:14:08 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma03dal.us.ibm.com with ESMTP id 3aqcsd112r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 31 Aug 2021 23:14:08 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17VNE7ba37224902
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 31 Aug 2021 23:14:07 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2E2BA12405C;
 Tue, 31 Aug 2021 23:14:07 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 867F712406E;
 Tue, 31 Aug 2021 23:14:06 +0000 (GMT)
Received: from demeter.local (unknown [9.65.103.130])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTPS;
 Tue, 31 Aug 2021 23:14:06 +0000 (GMT)
Subject: Re: OpenBmc Redfish support etag property error - sha512
To: Ed Tanous <edtanous@google.com>, "Zhang, ShuoX" <shuox.zhang@intel.com>
References: <DM5PR11MB1547951F649CFEEEE6188058E2CC9@DM5PR11MB1547.namprd11.prod.outlook.com>
 <CAH2-KxBV8AaW0aftJDOB2z75HyQXEV1ct6gbR-BYS90VWd=7AA@mail.gmail.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <634db90d-2b60-ba14-1dc4-7146e5b5b457@linux.ibm.com>
Date: Tue, 31 Aug 2021 18:14:05 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
In-Reply-To: <CAH2-KxBV8AaW0aftJDOB2z75HyQXEV1ct6gbR-BYS90VWd=7AA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: dHavoHKADp6mn9ce5DrPXL0Pfsh6KAJ4
X-Proofpoint-GUID: pNxF31wOaGLS_hy_WAuJT41MYZDiQ4VV
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-31_09:2021-08-31,
 2021-08-31 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 clxscore=1011 bulkscore=0 mlxscore=0 phishscore=0 malwarescore=0
 mlxlogscore=999 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108310126
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 8/31/21 12:17 PM, Ed Tanous wrote:
> On Tue, Aug 31, 2021 at 1:11 AM Zhang, ShuoX <shuox.zhang@intel.com> wrote:
>> hi,
>>
>>                Etag is to check whether the json string returned by the server has changed ,  I plan to use MD5 encryption to generate etag , can’t  find etag in http request header.
> That's because we don't currently implement etag.  If you're looking
> at adding it, keep in mind, implementation of etag is more than simply
> including the header, and likely has some changes that would need to
> be made to the internals of the system.
>
> PS, MD5 hasn't really been acceptable for hashing algorithms for a
> while now.  Please research what the current guidance is on what hash
> to use for this;  I suspect the guidance is still sha256.
>
>
...snip...

FWIW, OpenBMC Linux-PAM modules (pam_unix.so) use the SHA-512 secure 
hash algorithm.  OpenBMC gets this setting by default from 
Yocto/OpenEmbedded configuration.

For background reading, see 
https://en.wikipedia.org/wiki/Secure_Hash_Algorithms

- Joseph
