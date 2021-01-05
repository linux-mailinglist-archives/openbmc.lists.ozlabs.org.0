Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E1F2EAD46
	for <lists+openbmc@lfdr.de>; Tue,  5 Jan 2021 15:20:50 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D9F5q3MgjzDqR1
	for <lists+openbmc@lfdr.de>; Wed,  6 Jan 2021 01:20:47 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=mspinler@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=VNA0NjEl; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D9F3f5DMKzDqVs
 for <openbmc@lists.ozlabs.org>; Wed,  6 Jan 2021 01:18:54 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 105EIM7E113837; Tue, 5 Jan 2021 09:18:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=686WMFOEPl3dgV//Zm0ssPT+jdLMUET/6bpzCOfziOc=;
 b=VNA0NjElMB8GYTB6HqbB9GLT1cXcu37wd80i81WHiJrliPHapwUCClcXGoMURMgdjjzl
 LG0wARvHhqC0lpzVhcJ8oVh9kWee1JbtZunAGPBOK9uVAhLTolc6D/HsIgQhA+o054Qg
 aZvaC0uPF515BM5jvyS7TDYvE+RK9AvCxt9OznGMclpcf7iHTiIOkmwK4AqK/SV/anUZ
 /onA+DlXmcHGWSQ06/Uxbt9V8u2s/2NEcaSMqm/kQpCiyCotOhQPQXRZL4i6gvlKDtRP
 7ldYxKENVTXZ/BXn2Elym8nM3VQ/4cDs5fcwUS82q442pwQB+Bj5+i2ic0xxbhSTv7Wd DQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 35vsrdg0er-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Jan 2021 09:18:50 -0500
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 105EIoxS115158;
 Tue, 5 Jan 2021 09:18:50 -0500
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 35vsrdg0en-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Jan 2021 09:18:50 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 105E2oZP009252;
 Tue, 5 Jan 2021 14:18:49 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma03wdc.us.ibm.com with ESMTP id 35tgf8x29n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Jan 2021 14:18:49 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 105EIm5624248616
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 5 Jan 2021 14:18:48 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5F9956E05D;
 Tue,  5 Jan 2021 14:18:48 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C924A6E04C;
 Tue,  5 Jan 2021 14:18:47 +0000 (GMT)
Received: from [9.160.22.70] (unknown [9.160.22.70])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  5 Jan 2021 14:18:47 +0000 (GMT)
Subject: Re: hardcoded median function in phosphor-virtual-sensor
To: Lei Yu <yulei.sh@bytedance.com>
References: <7be00c72-db17-c751-470e-eb92f18f8bb3@linux.ibm.com>
 <CAJTGxZG36whmooeOvMcwkhj5aQtvr=s8QFCGXYNSX6Up6WMJhg@mail.gmail.com>
 <c4ced4dd-0b20-9c22-6dfe-99b22e51d0ab@linux.ibm.com>
 <CAGm54UFFJ5Rd=4v9X3LBP_Mp5LbkQrBFtT0-PeMGumzF8kdN0A@mail.gmail.com>
From: Matt Spinler <mspinler@linux.ibm.com>
Message-ID: <0098a230-acaf-173d-3e12-ede57cfcc563@linux.ibm.com>
Date: Tue, 5 Jan 2021 08:18:47 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAGm54UFFJ5Rd=4v9X3LBP_Mp5LbkQrBFtT0-PeMGumzF8kdN0A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-05_02:2021-01-05,
 2021-01-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0
 mlxlogscore=999 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 phishscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101050085
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
 Vijay Khemka <vijaykhemkalinux@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 1/4/2021 8:34 PM, Lei Yu wrote:
> On Tue, Jan 5, 2021 at 6:58 AM Matt Spinler <mspinler@linux.ibm.com> wrote:
>>>      whose values must be defined in entity-manager.  Since exprtk
>>>      expressions are not allowed in
>>>      entity-manager, I cannot just port the PVS's JSON config into an
>>>      entity-manager config.
>>>
>>> I missed this discussion but why can't we simply use virtual sensor as
>>> expertk provides median function and we have threshold support for
>>> each virtual sensor. Please help, if I am missing anything.
> I did not notice the discussion as well.
>  From my understanding, the exprtk is defined in the json config
> (/usr/share/phosphor-virtual-sensor/virtual_sensor_config.json), and
> technically we could use any expression that exprtk supports.
> e.g. we use max() in our system (see below example), which is not
> upstreamed yet but it works well.
>      "Expression": "max(T0, T1, T2)"

Yea, I agree, what you have here is exactly how PVS was designed to be used.
My  goal was to add support to have its config be able to be defined in
the entity manager JSON instead, which is what is driving the work of 
needing
selectable expressions based on the name.


