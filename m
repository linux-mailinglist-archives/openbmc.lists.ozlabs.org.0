Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B3AB519A
	for <lists+openbmc@lfdr.de>; Tue, 17 Sep 2019 17:34:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46XnGC2ZC2zDrgs
	for <lists+openbmc@lfdr.de>; Wed, 18 Sep 2019 01:34:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=msbarth@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Xn3m6c3YzF40Y
 for <openbmc@lists.ozlabs.org>; Wed, 18 Sep 2019 01:25:08 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8HEtDdA125500
 for <openbmc@lists.ozlabs.org>; Tue, 17 Sep 2019 11:07:47 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2v2yrqf71g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 17 Sep 2019 11:07:47 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x8HEttNr128682
 for <openbmc@lists.ozlabs.org>; Tue, 17 Sep 2019 11:07:47 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2v2yrqf70s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Sep 2019 11:07:46 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x8HEjHda013166;
 Tue, 17 Sep 2019 15:07:46 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma02wdc.us.ibm.com with ESMTP id 2v0swj9k9k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Sep 2019 15:07:46 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8HF7jnr51315022
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Sep 2019 15:07:45 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7E067AC05F;
 Tue, 17 Sep 2019 15:07:45 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5825FAC059;
 Tue, 17 Sep 2019 15:07:45 +0000 (GMT)
Received: from [9.10.99.12] (unknown [9.10.99.12])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 17 Sep 2019 15:07:45 +0000 (GMT)
Subject: Re: Fan PWM monitoring and control
To: rgrs <rgrs@protonmail.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <xsccJqqcmgguxAh42ykWadNuaYHHgIw0933Bk0tYCREDFQMFzoE43c9ULehB-J0Em4kobpg-P8xmKd5ukb9AdyIO9-JYrY8DrNAcVFkURyM=@protonmail.com>
From: Matthew Barth <msbarth@linux.ibm.com>
Message-ID: <87e610aa-72c7-32d2-9281-2c89023d397a@linux.ibm.com>
Date: Tue, 17 Sep 2019 10:07:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <xsccJqqcmgguxAh42ykWadNuaYHHgIw0933Bk0tYCREDFQMFzoE43c9ULehB-J0Em4kobpg-P8xmKd5ukb9AdyIO9-JYrY8DrNAcVFkURyM=@protonmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-17_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909170144
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


On 9/17/19 5:40 AM, rgrs wrote:
> Hi,
> 
> I need some help with phosphor hwmon related to fan sensors.
> 
> I'm trying to control Fans in a server motherboard using ADT7462 
> controller. Hw mon porting is done and the sysfs interfaces are working 
> as expected.
> 
> While I am able to read RPM, i don't find pwm/target to control the fans 
> exposed as dbus objects.
Do you have the hwmon config set similar to this to denote the fan 
targets are of PWM type?

https://github.com/openbmc/openbmc/blob/master/meta-ibm/meta-romulus/recipes-phosphor/sensors/phosphor-hwmon/obmc/hwmon/ahb/apb/pwm-tacho-controller%401e786000.conf
> 
> # busctl --no-page tree xyz.openbmc_project.FanSensor
> Failed to introspect object / of service xyz.openbmc_project.FanSensor: 
> The name is not activatable
> No objects discovered.
That does not look like a hwmon service name. If you are using 
phosphor-objmgr, you can use `# mapper get-service 
/xyz/openbmc_project/sensors/fan_tach` otherwise you'll need to find the 
hwmon service name associated with your fan controller device.
> 
> I came across this post, I think it is similar to my issue. 
> (https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-hwmon/+/8353)
> 
> Please someone point to latest documentation or reference Fan porting 
> from openBMC repo?
> What are the exact fields in YAML that are used create FanPWM objects.
The Romulus machine should be a good reference for PWM based fan control 
using phosphor-hwmon. It uses the 
phosphor-fan-presence/[control|monitor] apps for controlling and 
monitoring fans

https://github.com/openbmc/openbmc/tree/master/meta-ibm/meta-romulus
> 
> (I'm using Feb release in my sandbox, 
> https://github.com/openbmc/docs/blob/master/release/release-notes.md#26-feb-4-2019)
> 
> Thanks,
> Raj

Matt
