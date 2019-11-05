Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 097A1EF670
	for <lists+openbmc@lfdr.de>; Tue,  5 Nov 2019 08:32:19 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 476hFX0H59zF3vF
	for <lists+openbmc@lfdr.de>; Tue,  5 Nov 2019 18:32:16 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=vishwa@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 476hDv0sW4zF3nP
 for <openbmc@lists.ozlabs.org>; Tue,  5 Nov 2019 18:31:39 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 xA57RXNw029697
 for <openbmc@lists.ozlabs.org>; Tue, 5 Nov 2019 02:31:35 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2w33fbtruu-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 05 Nov 2019 02:31:34 -0500
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwa@linux.vnet.ibm.com>;
 Tue, 5 Nov 2019 07:31:33 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 5 Nov 2019 07:31:29 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xA57VSh955640312
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 5 Nov 2019 07:31:28 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 870EA52054;
 Tue,  5 Nov 2019 07:31:28 +0000 (GMT)
Received: from [9.122.210.30] (unknown [9.122.210.30])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 342EE52059;
 Tue,  5 Nov 2019 07:31:27 +0000 (GMT)
From: vishwa <vishwa@linux.vnet.ibm.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: Re: multiple telemetry designs
References: <D1177195-CDC9-4BB0-B9DE-6FC99B7ADE31@fuzziesquirrel.com>
 <dd81fb28-4d01-8726-9b16-81a677eb3e16@linux.intel.com>
 <8998b51b-4e67-738e-becd-63c26ea626be@linux.intel.com>
 <d69d24c7-d07f-35d4-1395-859a0df2a05a@linux.vnet.ibm.com>
 <DBA24EEE99A3B3489FF472F5E94DE6D7A30F946F@IRSMSX101.ger.corp.intel.com>
 <c3dd56aa-b9e2-1efd-1da6-70b0e056446f@linux.intel.com>
 <053009AE-890C-4650-9096-D4E8ABF707AA@fuzziesquirrel.com>
 <DBA24EEE99A3B3489FF472F5E94DE6D7A30F9DFD@IRSMSX101.ger.corp.intel.com>
 <9ECD367E-6573-4DA8-815E-E117AD8DF56C@fuzziesquirrel.com>
 <DBA24EEE99A3B3489FF472F5E94DE6D7A30FA694@IRSMSX101.ger.corp.intel.com>
 <C6A744EB-AB05-481F-AC96-09D4DE6ABE57@fuzziesquirrel.com>
Date: Tue, 5 Nov 2019 13:01:26 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <C6A744EB-AB05-481F-AC96-09D4DE6ABE57@fuzziesquirrel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19110507-0008-0000-0000-0000032ACCA0
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19110507-0009-0000-0000-00004A4A2536
Message-Id: <76cf53a7-9b1f-f724-356a-28ac97c918cc@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-11-05_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=732 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1911050061
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
Cc: "Mihm, James" <james.mihm@intel.com>,
 Justin Thaler <thalerj@linux.vnet.ibm.com>, "Matuszczak,
 Piotr" <piotr.matuszczak@intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "neladk@microsoft.com" <neladk@microsoft.com>,
 James Feist <james.feist@linux.intel.com>,
 "apparao.puli@linux.intel.com" <apparao.puli@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

There is also this version from Dell: 
https://gerrit.openbmc-project.xyz/#/c/openbmc/docs/+/23758/. Was this 
considered in this discussion ?.

Also, from IBM's standpoint, Justin Thaler was mentioning that we wanted 
a "true subscription" model, in that, clients can pick and chose the 
specific sensors.

Justin: Could you add here please ?

!! Vishwa !!

On 10/28/19 10:12 PM, Brad Bishop wrote:
>> On Oct 28, 2019, at 12:35 PM, Matuszczak, Piotr <piotr.matuszczak@intel.com> wrote:
>>
>> I would like to make the code opened from the very beginning.
> Glad to hear it - that sounds like the best way to me :-)
>
> FWIW, whenever you are ready to share it, I’d still like to see whatever code Intel has for the monitoring service.  It will help me understand your design better.  It is fine if it has bugs or it isn’t polished.  Thanks Piotr.
>
> -brad

