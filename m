Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C0F8C084
	for <lists+openbmc@lfdr.de>; Tue, 13 Aug 2019 20:22:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467Lfs4dnfzDqcM
	for <lists+openbmc@lfdr.de>; Wed, 14 Aug 2019 04:22:45 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=mspinler@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 467LfH4YL6zDqYq
 for <openbmc@lists.ozlabs.org>; Wed, 14 Aug 2019 04:22:14 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7DIKoGp056295; Tue, 13 Aug 2019 14:22:08 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uc12s3mnu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Aug 2019 14:22:07 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x7DIAP4w028764;
 Tue, 13 Aug 2019 18:22:06 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma02wdc.us.ibm.com with ESMTP id 2u9nj62xn3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Aug 2019 18:22:06 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7DIM6tn47776030
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Aug 2019 18:22:06 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 56E1F112064;
 Tue, 13 Aug 2019 18:22:06 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 318ED112061;
 Tue, 13 Aug 2019 18:22:06 +0000 (GMT)
Received: from [9.10.99.36] (unknown [9.10.99.36])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 13 Aug 2019 18:22:06 +0000 (GMT)
Subject: Re: Re-use witherspoon-psu-monitor
To: =?UTF-8?B?R2VvcmdlIExpdSAo5YiY6ZSh5LyfKQ==?= <liuxiwei@inspur.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <l7vrab9ffh6cynjgiq6wmlqm.1565599934470@email.jadenine.com>
From: Matt Spinler <mspinler@linux.ibm.com>
Message-ID: <5ae2cd44-0c3c-b960-c614-31d7920d9f05@linux.ibm.com>
Date: Tue, 13 Aug 2019 13:22:07 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <l7vrab9ffh6cynjgiq6wmlqm.1565599934470@email.jadenine.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-13_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908130171
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



On 8/12/2019 3:54 AM, George Liu (刘锡伟) wrote:
> Hi All,
>
> Recently I need to get the asset information of psu on the fp5280g2 machine. For the downstream, I think re-use witherspoon-psu-monitor is better. but currently it`s only adapted witherspoon machine.Is it possible to change this recipes to a general repo, so that a repo can be adapted to a variety of machines for future maintenance and updates?

Sounds like a good idea to me!  The only reason we put a witherspoon on 
the repo name in  the first place was because we didn't know how others 
would want to do PSU interaction at that time and we didn't want to 
presume that we should be a generic repo for it.

>
> I have a couple of question:
>
> 1. For the recipes of the witherspoon-psu-monitor, could it be changed to a generic name, for example...

Yea, we would definitely want to change the recipe name if we change the 
repo name.

>
> 2. When reading and updating the properties of the xyz.openbmc_project.Inventory.Decorator.Asset interface via the pmbus driver, could it be changed to a common configuration (eg yaml or json, etc.)

I'm not exactly sure what you're looking to do, but if the goal is to 
make it more generic, I'm all for it.  I have no problem with making 
things configurable.

>
> 3. /sys/kenerl/debug/pmbus/hwmonX/XXX/... Does each file name need to be unified?

If you're suggesting adding some configurable way of specifying which 
sysfs files to read, that also sounds like a good idea.

>
> Thanks!

