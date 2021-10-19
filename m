Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A14B433FC2
	for <lists+openbmc@lfdr.de>; Tue, 19 Oct 2021 22:25:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HYlbd5Wx3z3bg8
	for <lists+openbmc@lfdr.de>; Wed, 20 Oct 2021 07:25:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=toXbUup9;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=toXbUup9; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HYlbC36q3z2yfr;
 Wed, 20 Oct 2021 07:24:39 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19JJI37P020516; 
 Tue, 19 Oct 2021 16:24:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=vxrHAhnRe6WhgnolQ/Fpgp5YIFLWPE4T7HjgC+P+xyQ=;
 b=toXbUup9wkTnWIALUxlLmcd/S1qhQnxrNlmMYoCuyfkkcSK2gN7/5kXB/A9r3372jHkE
 7R9Kt6gdIUnBwa/AU6jSrWV1uVZR+DsgDGRfXt3WDNoSC2vxY90fHWmUHeKLdZrVC/HN
 8Ok3tKEgDOOazdgvkpusZ+ethRlgYWKYcf0JCLFbY1P+hoqEybwi3s6s6AOakH6sjXFK
 A1VZZzPSv5b7fI0dW2K7EjixG5Nk5SLcfyfGsuIyJ9l26hjZrx55URZPk2FMWpxugL5c
 UrVrbYzumaWlFFN7Uwvhg8kwCkbNityK/4TNUPOjEIFmwwuC4dUEtKFAr9+/lo6m0mjb KQ== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bt2qykbxf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Oct 2021 16:24:35 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19JKDN8u010286;
 Tue, 19 Oct 2021 20:24:34 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma03dal.us.ibm.com with ESMTP id 3bqpcbdyw3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Oct 2021 20:24:34 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19JKOXMF31392234
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Oct 2021 20:24:33 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6E6D16E059;
 Tue, 19 Oct 2021 20:24:33 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3497F6E05D;
 Tue, 19 Oct 2021 20:24:33 +0000 (GMT)
Received: from [9.211.36.93] (unknown [9.211.36.93])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 19 Oct 2021 20:24:33 +0000 (GMT)
Subject: Re: [PATCH] fsi: sbefifo: Add sysfs file indicating a timeout error
To: Joel Stanley <joel@jms.id.au>, Amitay Isaacs <amitay@ozlabs.org>
References: <20210920190031.22168-1-eajames@linux.ibm.com>
 <CACPK8XczD=4PXxRQrZ=aGCYtZk47i4-XoFVwep04qszf3Ls6jg@mail.gmail.com>
From: Eddie James <eajames@linux.ibm.com>
Message-ID: <2edfe3a2-a853-3cfc-55fb-f89f5d68e7e1@linux.ibm.com>
Date: Tue, 19 Oct 2021 15:24:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XczD=4PXxRQrZ=aGCYtZk47i4-XoFVwep04qszf3Ls6jg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: nyS-u48evwPY8CFNFZ2DEzewUn8v6HlH
X-Proofpoint-ORIG-GUID: nyS-u48evwPY8CFNFZ2DEzewUn8v6HlH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-19_02,2021-10-19_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 phishscore=0 adultscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110190116
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-fsi@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 10/15/21 12:08 AM, Joel Stanley wrote:
> On Mon, 20 Sept 2021 at 19:00, Eddie James <eajames@linux.ibm.com> wrote:
>> The SBEFIFO timeout error requires special handling in userspace
>> to do recovery operations. Add a sysfs file to indicate a timeout
>> error, and notify pollers when a timeout occurs.
> Should this have some documentation too?


Yes, will add in v2.


>
> What userspace uses this?


At the moment, the openpower-occ-control application.


>
> Looks good to me otherwise.
>
> Reviewed-by: Joel Stanley <joel@jms.id.au>


Thanks!

Eddie


>
>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
>> ---
>>   drivers/fsi/fsi-sbefifo.c | 16 ++++++++++++++++
>>   1 file changed, 16 insertions(+)
>>
>> diff --git a/drivers/fsi/fsi-sbefifo.c b/drivers/fsi/fsi-sbefifo.c
>> index 84cb965bfed5..b414ab4431ef 100644
>> --- a/drivers/fsi/fsi-sbefifo.c
>> +++ b/drivers/fsi/fsi-sbefifo.c
>> @@ -124,6 +124,7 @@ struct sbefifo {
>>          bool                    broken;
>>          bool                    dead;
>>          bool                    async_ffdc;
>> +       bool                    timed_out;
>>   };
>>
>>   struct sbefifo_user {
>> @@ -136,6 +137,14 @@ struct sbefifo_user {
>>
>>   static DEFINE_MUTEX(sbefifo_ffdc_mutex);
>>
>> +static ssize_t timeout_show(struct device *dev, struct device_attribute *attr,
>> +                           char *buf)
>> +{
>> +       struct sbefifo *sbefifo = container_of(dev, struct sbefifo, dev);
>> +
>> +       return sysfs_emit(buf, "%d\n", sbefifo->timed_out ? 1 : 0);
>> +}
>> +static DEVICE_ATTR_RO(timeout);
>>
>>   static void __sbefifo_dump_ffdc(struct device *dev, const __be32 *ffdc,
>>                                  size_t ffdc_sz, bool internal)
>> @@ -462,11 +471,14 @@ static int sbefifo_wait(struct sbefifo *sbefifo, bool up,
>>                          break;
>>          }
>>          if (!ready) {
>> +               sysfs_notify(&sbefifo->dev.kobj, NULL, dev_attr_timeout.attr.name);
>> +               sbefifo->timed_out = true;
>>                  dev_err(dev, "%s FIFO Timeout ! status=%08x\n", up ? "UP" : "DOWN", sts);
>>                  return -ETIMEDOUT;
>>          }
>>          dev_vdbg(dev, "End of wait status: %08x\n", sts);
>>
>> +       sbefifo->timed_out = false;
>>          *status = sts;
>>
>>          return 0;
>> @@ -993,6 +1005,8 @@ static int sbefifo_probe(struct device *dev)
>>                                   child_name);
>>          }
>>
>> +       device_create_file(&sbefifo->dev, &dev_attr_timeout);
>> +
>>          return 0;
>>    err_free_minor:
>>          fsi_free_minor(sbefifo->dev.devt);
>> @@ -1018,6 +1032,8 @@ static int sbefifo_remove(struct device *dev)
>>
>>          dev_dbg(dev, "Removing sbefifo device...\n");
>>
>> +       device_remove_file(&sbefifo->dev, &dev_attr_timeout);
>> +
>>          mutex_lock(&sbefifo->lock);
>>          sbefifo->dead = true;
>>          mutex_unlock(&sbefifo->lock);
>> --
>> 2.27.0
>>
