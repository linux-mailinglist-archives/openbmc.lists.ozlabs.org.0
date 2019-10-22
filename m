Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D52AAE04E7
	for <lists+openbmc@lfdr.de>; Tue, 22 Oct 2019 15:25:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46yDlV4pQpzDqM7
	for <lists+openbmc@lfdr.de>; Wed, 23 Oct 2019 00:25:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=mspinler@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46yDjh577nzDqFs
 for <openbmc@lists.ozlabs.org>; Wed, 23 Oct 2019 00:23:50 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9MDMdRo075057; Tue, 22 Oct 2019 09:23:43 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vt0ks58mt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Oct 2019 09:23:43 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x9MDJndd010083;
 Tue, 22 Oct 2019 13:23:42 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma02wdc.us.ibm.com with ESMTP id 2vqt47ekba-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Oct 2019 13:23:42 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x9MDNfWI55181676
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Oct 2019 13:23:41 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 420B4C605F;
 Tue, 22 Oct 2019 13:23:41 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0E33AC6055;
 Tue, 22 Oct 2019 13:23:40 +0000 (GMT)
Received: from [9.10.99.47] (unknown [9.10.99.47])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 22 Oct 2019 13:23:40 +0000 (GMT)
Subject: Re: [External] Power-on monitor for phosphor-hwmon question
To: Ivan Li11 <rli11@lenovo.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <c353f372a5ce45fdbe1172678d8c029d@lenovo.com>
 <82798e33e5a34f81ac30553c099ad964@lenovo.com>
From: Matt Spinler <mspinler@linux.ibm.com>
Message-ID: <24228a0e-1e29-d661-3cc1-585e9a0501a4@linux.ibm.com>
Date: Tue, 22 Oct 2019 08:23:40 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <82798e33e5a34f81ac30553c099ad964@lenovo.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-22_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910220123
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



On 10/21/2019 6:02 AM, Ivan Li11 wrote:
>
> Hi Team,
>
> Does anyone have suggestion for this ?
>
Hi, you're right, it doesn't support that yet.  We've had a few internal
discussions about how to handle that gracefully, though our platforms 
don't use
sel-logger, but nothing solid came out of them and we don't have anything
scheduled yet.

It would be easy enough to have a watch on the PGOOD property, and then 
do you
what you want, like maybe turning off the thresholds.

I heard that the d-bus sensors repository has some sort of support for this,
but since we don't use it I'm not sure what all that entails. I think it may
also force you to replace phosphor-inventor-manager with entity-manager.

> Thanks your great support in advance.
>
> *From:*openbmc <openbmc-bounces+rli11=lenovo.com@lists.ozlabs.org> *On 
> Behalf Of *Ivan Li11
> *Sent:* Friday, October 18, 2019 5:59 PM
> *To:* openbmc@lists.ozlabs.org
> *Subject:* [External] Power-on monitor for phosphor-hwmon question
>
> Hi Team,
>
> We found that there’s no power-on monitor mechanism in phosphor-hwmon.
>
> https://github.com/openbmc/phosphor-hwmon
>
> And it will cause incorrect threshold logs to be added to journal log 
> by ‘sel-logger’ when system is in power off(S5) state.
>
> Is there any plan to implement it? Or other repository we can refer to ?
>
> Thanks,
>
> Ivan
>

