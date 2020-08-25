Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F372525223C
	for <lists+openbmc@lfdr.de>; Tue, 25 Aug 2020 22:53:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bbh6Q2knDzDqXr
	for <lists+openbmc@lfdr.de>; Wed, 26 Aug 2020 06:53:34 +1000 (AEST)
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
 header.s=pp1 header.b=aXQYvJVY; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bbh5Z1r4SzDqVR;
 Wed, 26 Aug 2020 06:52:49 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07PKkSVG066242; Tue, 25 Aug 2020 16:52:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=mime-version :
 content-type : content-transfer-encoding : date : from : to : cc : subject
 : in-reply-to : references : message-id; s=pp1;
 bh=IJo532gRG0LinvkoR/w/OW6YQ4BsYZA/dqIPbD0yUwY=;
 b=aXQYvJVYleke8Q95oBWFppwRBdSQ4deWE98Msw1At6zP/Sx9BKpOG0yN+a6fN19lQIa+
 XVsA1xane6CP6ij+nNFV9E5sV+WKPxNCaztQJ7Nk3lZNxjw5S49qidCin2+tOEa4s3Hd
 dLrGrARK1MG4SdEEVgrurLIESzHU8FMjpXVWJlODtCukf4Bjpyo4jbEHIHYWXFn0DOPI
 5RvCk/cRYsFmWjcWAymiBtxzYbv0l9P0l7WdlkWShPWa5VEXipIfpzFdidkSC8JrnNh9
 O2wtNNFgvQ2qcYfI7poe2yWcI3saudsI9U/u2jWILfm6UjVfjZMHkLWcTjDR6bAAbus3 EQ== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3359yrg2w1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Aug 2020 16:52:45 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07PKqTh7020230;
 Tue, 25 Aug 2020 20:52:44 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma02wdc.us.ibm.com with ESMTP id 332ujq4grm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Aug 2020 20:52:44 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07PKqca920971900
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Aug 2020 20:52:38 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 190586A04F;
 Tue, 25 Aug 2020 20:52:43 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E67A76A047;
 Tue, 25 Aug 2020 20:52:42 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 25 Aug 2020 20:52:42 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 25 Aug 2020 15:52:42 -0500
From: Adriana Kobylak <anoo@linux.ibm.com>
To: Patrick Williams <patrick@stwcx.xyz>
Subject: Re: sdbusplus - const/readonly flags
In-Reply-To: <20200825150028.GK3532@heinlein>
References: <20200825150028.GK3532@heinlein>
Message-ID: <421fddd2a3f5b352f0cd5b260216bc8b@linux.vnet.ibm.com>
X-Sender: anoo@linux.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-25_09:2020-08-25,
 2020-08-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0
 mlxlogscore=738 spamscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1011 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008250155
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
Cc: openbmc <openbmc-bounces+anoo=linux.ibm.com@lists.ozlabs.org>,
 OpenBMC List <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 2020-08-25 10:00, Patrick Williams wrote:

>    * I expect some of the 'const' flags in phosphor-dbus-interfaces are
>      wrong and should be changed to 'readonly'.  I have collected a 
> list
>      of them in a gist[4].  If you really intend to mean "this property
>      will never change during the life of an object" continue to use
>      'const', but if you mean "this property shall not be changed by
>      clients", use 'readonly' (and probably also add 'emits_change').

There are also some properties in phosphor-dbus-interfaces with 
descriptions that say "read-only property", and the implementation is 
enforcing it. It may good for the owners to revisit those as well and 
see if a 'read-only' flag is applicable.

> 1.
> https://manpages.debian.org/experimental/libsystemd-dev/SD_BUS_WRITABLE_PROPERTY.3.en.html#Flags
> 2. https://github.com/openbmc/sdbusplus/issues/48
> 3.
> https://github.com/openbmc/sdbusplus/commit/e1c73d3bf8f6cabc1c58f67a233dba55b6f76d74
> 4. 
> https://gist.github.com/williamspatrick/fa975c33f00640ca54a7aa246bbbfeb9
