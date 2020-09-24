Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B25B2766A6
	for <lists+openbmc@lfdr.de>; Thu, 24 Sep 2020 04:59:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bxfrp3X56zDqST
	for <lists+openbmc@lfdr.de>; Thu, 24 Sep 2020 12:59:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=sz3X0iQO; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bxfr7344mzDqS2
 for <openbmc@lists.ozlabs.org>; Thu, 24 Sep 2020 12:58:30 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08O2VMPZ082300
 for <openbmc@lists.ozlabs.org>; Wed, 23 Sep 2020 22:58:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=PrG4Ay1gGJFxxdRTmuEmjc0l7mIeVrOc4BTejTeMbqc=;
 b=sz3X0iQOTpPaQu/R93ZeGDad9m48WkdyBCxxHUhCqs1J2Oev9pjDcgSCsvqYQ1KlCtaH
 olPpmQcA66fq8GgMnk08/kPL6cggEhDVpgyeg5LUkE4vkjAue7Pe/hzml3AwrnlqM9ex
 mNjmMAfnqH8eVPgDNejjshzbtRR6PLtzp/g+Ubm9k4TaUCTjek3OkIKVcesltpIhHeUH
 7RZPZ74i4Zw+v3Ig5ggznXWayJYXIK5BnDHYFRQwjs++3P3qd1DbHf5/ce4J7cINHY0o
 GbAZMofz7mvcMsBYpkrsoHGOKyCHYcQ6biC/6JPS72keAQEy5+OMkzsWv9Wlo32Oipbz oQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33rjg2grcs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 23 Sep 2020 22:58:27 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 08O2WH3C084563
 for <openbmc@lists.ozlabs.org>; Wed, 23 Sep 2020 22:58:27 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33rjg2grcq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Sep 2020 22:58:27 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08O2wKL4030217;
 Thu, 24 Sep 2020 02:58:27 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma01wdc.us.ibm.com with ESMTP id 33q41hb493-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Sep 2020 02:58:27 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08O2wQJE9699752
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Sep 2020 02:58:26 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1CE55BE04F;
 Thu, 24 Sep 2020 02:58:26 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B2564BE053;
 Thu, 24 Sep 2020 02:58:25 +0000 (GMT)
Received: from demeter.roc.mn.charter.com (unknown [9.80.207.145])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Thu, 24 Sep 2020 02:58:25 +0000 (GMT)
Subject: Re: Action: OpenBMC community messaging survey
To: krtaylor <kurt.r.taylor@gmail.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <19c81092-8639-ce87-2515-c77ef7ae9001@gmail.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <2fc9aa49-20d4-7fc3-86be-459ace8791da@linux.ibm.com>
Date: Wed, 23 Sep 2020 21:58:24 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <19c81092-8639-ce87-2515-c77ef7ae9001@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-24_01:2020-09-23,
 2020-09-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 spamscore=0 impostorscore=0 mlxlogscore=999 lowpriorityscore=0
 suspectscore=0 mlxscore=0 phishscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009240014
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

On 9/23/20 2:48 PM, krtaylor wrote:
> Hello everyone,
>
> I am doing a survey. If you DO NOT use IRC, would you start 
> communicating regularly with the community if we used a different 
> messaging platform? Maybe some other reason?
>
> I am not suggesting anything at the moment, just looking at ways to 
> remove any communication barriers and improve open designs and 
> development.
>
> If you DO NOT USE IRC regularly, please follow this link for a short 
> survey. It is completely anonymous and will remain open until 12:00pm 
> Central, Monday September 28th.

Hi Kurt.  Thanks for trying to improve communication within the OpenBMC 
community.

I was confused by the survey and did not submit my answers.  I use the 
IRC (per [1]) but sometimes go days without reading, and rarely 
respond.  I find IRC setup confusing, but easy enough to use.  And I 
would prefer to use slack features such as a full conversation history 
and threaded conversations.

- Joseph

[1]: https://github.com/openbmc/openbmc#contact

> https://www.surveymonkey.com/r/33BVDR6
>
> THANKS!
>
> Kurt Taylor (krtaylor)

