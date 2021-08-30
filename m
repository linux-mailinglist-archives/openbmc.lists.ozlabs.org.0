Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA1A3FBD50
	for <lists+openbmc@lfdr.de>; Mon, 30 Aug 2021 22:12:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gz1gn0nQRz2yNZ
	for <lists+openbmc@lfdr.de>; Tue, 31 Aug 2021 06:12:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UMm4gkkr;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=UMm4gkkr; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gz1gD3CKlz2xtp
 for <openbmc@lists.ozlabs.org>; Tue, 31 Aug 2021 06:11:35 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17UK4Jgj105651; Mon, 30 Aug 2021 16:11:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=2SyooZdnHtual5yJhGdNvkAyvDBMpvx8pxskmvf6M+U=;
 b=UMm4gkkrzcaHetrWw4XbE/f6J52+SpWFqEB6xlcDkooRK6T2hz/54wbC+awxcSzxzLiL
 YUMAnO+2aiGM8UAeMholRsrMewomNtvwrG12DrHXWIkOWO6pEkEqG8WilbCTcGKFo9EP
 ahe7dGnz1KM+O9WL1p7FX/DQb/Bo19pjUOvg2sfNudQ6Z9/AAOJkGZOKVYXJjG1zDYGH
 tThugHK/W0qm/PzQOj8WX1M5G0EJK9euSEPSNuy43XgoHTrVEaXegcV5xB0ZKRjvp/qQ
 QcpwX7EYP9IunMKY6/dmTrxGrL5kcy73Dwv+h6jJMOOZHXGTQ1WMuwQRWByszamFx40j EQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3as5hrguk8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Aug 2021 16:11:31 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17UK4aQe106361;
 Mon, 30 Aug 2021 16:11:31 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3as5hrgujw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Aug 2021 16:11:31 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17UK8Z63031850;
 Mon, 30 Aug 2021 20:11:30 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma04wdc.us.ibm.com with ESMTP id 3aqcsb26r7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Aug 2021 20:11:30 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17UKBU8338732068
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 30 Aug 2021 20:11:30 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 24735AC067;
 Mon, 30 Aug 2021 20:11:30 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7D4E5AC060;
 Mon, 30 Aug 2021 20:11:29 +0000 (GMT)
Received: from v0005c16 (unknown [9.211.63.17])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 30 Aug 2021 20:11:29 +0000 (GMT)
Message-ID: <e329beeb2b8efa272d2660fcd253ad5c98a37c50.camel@linux.ibm.com>
Subject: Re: [PATCH] hwmon: (pmbus/ibm-cffps) Do not swap max_power_out
From: Eddie James <eajames@linux.ibm.com>
To: Guenter Roeck <linux@roeck-us.net>, Brandon Wyman <bjwyman@gmail.com>
Date: Mon, 30 Aug 2021 15:11:28 -0500
In-Reply-To: <e5916b33-8898-a483-bc69-49a08913672c@roeck-us.net>
References: <20210827230433.3596370-1-bjwyman@gmail.com>
 <20210828155250.GA820265@roeck-us.net>
 <e9de99d88fb9e2e34552806fa47efa488332325c.camel@linux.ibm.com>
 <e5916b33-8898-a483-bc69-49a08913672c@roeck-us.net>
Organization: IBM
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-16.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: isaSGdNhacGxV1YlKhVVV-pytyaO5nOc
X-Proofpoint-ORIG-GUID: epsEedaVHFX0rV-W5EMsIbXXO0Q-3Kzy
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-30_06:2021-08-30,
 2021-08-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 mlxscore=0 mlxlogscore=999 phishscore=0 spamscore=0
 suspectscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2107140000 definitions=main-2108300128
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
Cc: linux-hwmon@vger.kernel.org, openbmc@lists.ozlabs.org,
 Jean Delvare <jdelvare@suse.com>, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 2021-08-30 at 08:34 -0700, Guenter Roeck wrote:
> On 8/30/21 6:50 AM, Eddie James wrote:
> > On Sat, 2021-08-28 at 08:52 -0700, Guenter Roeck wrote:
> > > On Fri, Aug 27, 2021 at 11:04:33PM +0000, Brandon Wyman wrote:
> > > > The bytes for max_power_out from the ibm-cffps devices do not
> > > > need
> > > > to be
> > > > swapped.
> > > > 
> > > > Signed-off-by: Brandon Wyman <bjwyman@gmail.com>
> > > 
> > > Eddie, can you confirm this ?
> > 
> > This can't be true for all the power supplies supported by this
> > driver,
> > no. I think we need to check the version first. Brandon, I tested
> > this
> > on witherspoon (which is psu version 1) and get 3148 watts. If it's
> > not
> > swapped, that would be 19468 watts...
> > 
> 
> Hmm. Eddie, can you also have a look at commit 9fed8fa99334 ("hwmon:
> (pmbus/ibm-cffps) Fix write bits for LED control") ?
> We need to make sure that it doesn't mess up some versions of this
> PS.

That one looks correct to me. I believe older PSUs didn't enforce this
so I didn't catch it, but I do see that the older specifications
mention setting bit 6 to "allow write".

Thanks,
Eddie

> 
> Thanks,
> Guenter

