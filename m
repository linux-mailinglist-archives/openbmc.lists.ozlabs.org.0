Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1603FB748
	for <lists+openbmc@lfdr.de>; Mon, 30 Aug 2021 15:51:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GysDg1tT5z2yMg
	for <lists+openbmc@lfdr.de>; Mon, 30 Aug 2021 23:51:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GYQiMHB8;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=GYQiMHB8; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GysD93y6nz2xXn
 for <openbmc@lists.ozlabs.org>; Mon, 30 Aug 2021 23:51:05 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17UDXuCD031396; Mon, 30 Aug 2021 09:51:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=T7mZ/i2u0bISa+Q79WvicjvogP50o8J+Bxn4KpgyhYI=;
 b=GYQiMHB8ua6VSxBWchvoJ4aNe7OCcGpWbUuBSTTsj3nUNy4VkBKrlXdqLy9DVUqPcFan
 piJnnndLwk4gcF/jql+n4dBxIAAqgcoGuyq+fPATOZJDQ+iO0X3Hkbzvv8N9lqHoXRKA
 OZFFm0Bqr2g1u0IN//ZV+E02WnJoD/j+/7PCA9yuMtbd4TlmIsMrs/RxLHNnOttQ/5Ti
 qRGlo1wKM0AlyyTcreUP5dvJQVS34HtV30MU0e5jpBUrIRcW/qwY/rl3rTKDlLEvO+Ce
 vZwebNOUpm8wWgx1bV/3pz786ltUKb3K4lcn+0qPi9NPhpdTS8GF4SEUakTc7KBIw7Yi 2A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3arvrcnu0u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Aug 2021 09:51:01 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17UDcEIa055458;
 Mon, 30 Aug 2021 09:51:00 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3arvrcnu0f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Aug 2021 09:51:00 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17UDmPcN028024;
 Mon, 30 Aug 2021 13:50:59 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma01dal.us.ibm.com with ESMTP id 3aqcscq6xb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Aug 2021 13:50:59 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17UDowRg14352790
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 30 Aug 2021 13:50:58 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5D0BA6E05B;
 Mon, 30 Aug 2021 13:50:58 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 08F6D6E050;
 Mon, 30 Aug 2021 13:50:57 +0000 (GMT)
Received: from v0005c16 (unknown [9.211.63.17])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 30 Aug 2021 13:50:57 +0000 (GMT)
Message-ID: <e9de99d88fb9e2e34552806fa47efa488332325c.camel@linux.ibm.com>
Subject: Re: [PATCH] hwmon: (pmbus/ibm-cffps) Do not swap max_power_out
From: Eddie James <eajames@linux.ibm.com>
To: Guenter Roeck <linux@roeck-us.net>, Brandon Wyman <bjwyman@gmail.com>
Date: Mon, 30 Aug 2021 08:50:57 -0500
In-Reply-To: <20210828155250.GA820265@roeck-us.net>
References: <20210827230433.3596370-1-bjwyman@gmail.com>
 <20210828155250.GA820265@roeck-us.net>
Organization: IBM
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-16.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: XHNV1rD5jQNKm2G9iVJm7pV2k9PdSKDC
X-Proofpoint-ORIG-GUID: zqG0A02c2q5D1uyKXGk9iY1aB9xSDIun
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-30_05:2021-08-30,
 2021-08-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 adultscore=0 mlxlogscore=999 bulkscore=0 suspectscore=0
 mlxscore=0 spamscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108300096
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

On Sat, 2021-08-28 at 08:52 -0700, Guenter Roeck wrote:
> On Fri, Aug 27, 2021 at 11:04:33PM +0000, Brandon Wyman wrote:
> > The bytes for max_power_out from the ibm-cffps devices do not need
> > to be
> > swapped.
> > 
> > Signed-off-by: Brandon Wyman <bjwyman@gmail.com>
> 
> Eddie, can you confirm this ?

This can't be true for all the power supplies supported by this driver,
no. I think we need to check the version first. Brandon, I tested this
on witherspoon (which is psu version 1) and get 3148 watts. If it's not
swapped, that would be 19468 watts...

Thanks,
Eddie

> 
> Thanks,
> Guenter
> 
> > ---
> >  drivers/hwmon/pmbus/ibm-cffps.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/hwmon/pmbus/ibm-cffps.c
> > b/drivers/hwmon/pmbus/ibm-cffps.c
> > index df712ce4b164..29b77f192c9e 100644
> > --- a/drivers/hwmon/pmbus/ibm-cffps.c
> > +++ b/drivers/hwmon/pmbus/ibm-cffps.c
> > @@ -171,7 +171,7 @@ static ssize_t ibm_cffps_debugfs_read(struct
> > file *file, char __user *buf,
> >  		cmd = CFFPS_SN_CMD;
> >  		break;
> >  	case CFFPS_DEBUGFS_MAX_POWER_OUT:
> > -		rc = i2c_smbus_read_word_swapped(psu->client,
> > +		rc = i2c_smbus_read_word_data(psu->client,
> >  						 CFFPS_MAX_POWER_OUT_CM
> > D);
> >  		if (rc < 0)
> >  			return rc;
> > -- 
> > 2.25.1
> > 

