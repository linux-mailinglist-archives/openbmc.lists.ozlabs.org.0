Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CF30519C442
	for <lists+openbmc@lfdr.de>; Thu,  2 Apr 2020 16:32:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tQWF47jgzDrTf
	for <lists+openbmc@lfdr.de>; Fri,  3 Apr 2020 01:32:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tQVP4ggXzDrR1
 for <openbmc@lists.ozlabs.org>; Fri,  3 Apr 2020 01:31:24 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 032E2AHC077846; Thu, 2 Apr 2020 10:31:21 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3043g9er2h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Apr 2020 10:31:21 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 032E2bX4080843;
 Thu, 2 Apr 2020 10:31:21 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3043g9er20-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Apr 2020 10:31:21 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 032EUNLg025048;
 Thu, 2 Apr 2020 14:31:19 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma04wdc.us.ibm.com with ESMTP id 301x771huy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Apr 2020 14:31:19 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 032EVJJ031654196
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 2 Apr 2020 14:31:19 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 57B7EB205F;
 Thu,  2 Apr 2020 14:31:19 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CF8AEB2067;
 Thu,  2 Apr 2020 14:31:18 +0000 (GMT)
Received: from [9.163.31.233] (unknown [9.163.31.233])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  2 Apr 2020 14:31:18 +0000 (GMT)
Subject: Re: [PATCH linux dev-5.4 1/2] hwmon: (pmbus/ibm-cffps) Add another
 PSU CCIN to version detection
To: Joel Stanley <joel@jms.id.au>, Guenter Roeck <linux@roeck-us.net>
References: <20200401220339.2006-1-eajames@linux.ibm.com>
 <20200401220339.2006-2-eajames@linux.ibm.com>
 <fc05a492-f04b-b80d-51a0-52cb793e5c9d@roeck-us.net>
 <CACPK8XcKpK9Fz8GmudSYVqph0MBFKpwrCdr68Hha1wtamLLNhw@mail.gmail.com>
From: Eddie James <eajames@linux.ibm.com>
Message-ID: <03116ba3-9054-344c-7890-dbb9ccabd038@linux.ibm.com>
Date: Thu, 2 Apr 2020 09:31:18 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XcKpK9Fz8GmudSYVqph0MBFKpwrCdr68Hha1wtamLLNhw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-02_05:2020-03-31,
 2020-04-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0 clxscore=1015
 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004020124
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
 Brandon Wyman <bjwyman@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 4/1/20 5:20 PM, Joel Stanley wrote:
> On Wed, 1 Apr 2020 at 22:13, Guenter Roeck <linux@roeck-us.net> wrote:
>> On 4/1/20 3:03 PM, Eddie James wrote:
>>> There is an additional CCIN for the IBM CFFPS that may be classifed as
>>> either version one or version two, based upon the rest of the bits of
>>> the CCIN. Add support for it in the version detection.
>>>
>>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
>>> Link: https://lore.kernel.org/r/1583948590-17220-1-git-send-email-eajames@linux.ibm.com
>>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>> Those e-mails are confusing. Can you drop me from cc:, please ?
> I think Eddie forgot to --suppress-cc=body when he git send-email'd
>
> Sorry for the noise Guenter.


Indeed, my apologies.

Thanks,

Eddie


>
> Cheers,
>
> Joel
