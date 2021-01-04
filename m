Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 817002E9C58
	for <lists+openbmc@lfdr.de>; Mon,  4 Jan 2021 18:49:26 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D8jmz5NLtzDqNb
	for <lists+openbmc@lfdr.de>; Tue,  5 Jan 2021 04:49:23 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=mspinler@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=HcjjFgNl; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D8jm74RJgzDqNH
 for <openbmc@lists.ozlabs.org>; Tue,  5 Jan 2021 04:48:36 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 104HWGLn125934
 for <openbmc@lists.ozlabs.org>; Mon, 4 Jan 2021 12:48:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : subject : to :
 message-id : date : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=8sZOric8XLhM8p94NNuEJE4Xw+h7P1nceIxYR6laD/0=;
 b=HcjjFgNlh8O0ac1qdjcawyiw0ivZf4AG8hi0vPQ8ZAqwh5WS+v2fdRalfI2fH0GvnlXS
 D0yZMBU9YX+KSdXpBU26EXI3rSjhYgLl5Cukr19Q8UBAWdYQ+VS5ynTnSG1LQ5zVjTbC
 tpM9BkXeGeFhfdnhrvaatx8mBCabiPIqwirAFV+bdyYo3zanqQYZeOjYN946N9jhQ2JQ
 FUHRILLOqh9fcPRWUZmgv2eWZ/YEofbArMI+jNnbPP5MxMu5DnJIzgJGns4g2dxSy58h
 FGBx8spuN9++CiaBms93ctBWTPhla8UFeokcHa65xN8ke/EuE6Si5mk+pxFhBnaohfpp oA== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35v7ds0fg8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 04 Jan 2021 12:48:33 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 104Hll3M023508
 for <openbmc@lists.ozlabs.org>; Mon, 4 Jan 2021 17:48:33 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma02dal.us.ibm.com with ESMTP id 35tgf93rsv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 04 Jan 2021 17:48:33 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 104HmWb921037350
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Mon, 4 Jan 2021 17:48:32 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 69E9EAC062
 for <openbmc@lists.ozlabs.org>; Mon,  4 Jan 2021 17:48:32 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3838AAC05B
 for <openbmc@lists.ozlabs.org>; Mon,  4 Jan 2021 17:48:32 +0000 (GMT)
Received: from [9.160.44.189] (unknown [9.160.44.189])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP
 for <openbmc@lists.ozlabs.org>; Mon,  4 Jan 2021 17:48:32 +0000 (GMT)
From: Matt Spinler <mspinler@linux.ibm.com>
Subject: hardcoded median function in phosphor-virtual-sensor
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Message-ID: <7be00c72-db17-c751-470e-eb92f18f8bb3@linux.ibm.com>
Date: Mon, 4 Jan 2021 11:48:31 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-04_11:2021-01-04,
 2021-01-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 mlxlogscore=741 mlxscore=0
 clxscore=1011 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101040111
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

Hi,

Just putting on the list what was decided after some lengthy discussions 
on discord.

I need a median of some sensor values, where this median sensor has 
threshold interfaces
whose values must be defined in entity-manager.  Since exprtk 
expressions are not allowed in
entity-manager, I cannot just port the PVS's JSON config into an 
entity-manager config.

Instead, I will make a new entity-manager config that will have the 
component sensors
along  with the thresholds to use, with a subtype of median, vaguely 
something like:

{

Type: "VirtualSensor"

Name: "MySensorName"

Subtype: "Median"

Sensors: [ "Sensor1", "Sensor2", .... ]

ThresholdsWithHysteresis [ ]

minInput: 0

maxInput: 100

}


The minInput/maxInput are needed so we don't use garbage sensor readings 
in the median
algorithm.  PVS will look for this config to be provided on D-Bus by 
entity-manager, and if
it's there it will calculate the median (in C++, not exprtk) and use it 
as the virtual sensor value.

Thanks,
Matt

