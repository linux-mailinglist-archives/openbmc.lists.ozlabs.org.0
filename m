Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E4E10294D
	for <lists+openbmc@lfdr.de>; Tue, 19 Nov 2019 17:25:08 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47HWPs5QPvzDqc3
	for <lists+openbmc@lfdr.de>; Wed, 20 Nov 2019 03:25:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=gmills@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HWN353RMzDqgd
 for <openbmc@lists.ozlabs.org>; Wed, 20 Nov 2019 03:23:31 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAJGDJX2073976; Tue, 19 Nov 2019 11:23:27 -0500
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2waygmj7wg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Nov 2019 11:23:27 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xAJGE0P2001987;
 Tue, 19 Nov 2019 16:23:26 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma02dal.us.ibm.com with ESMTP id 2wa8r6bwcp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Nov 2019 16:23:26 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xAJGNPJL48038386
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Nov 2019 16:23:25 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7416FC605D;
 Tue, 19 Nov 2019 16:23:25 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 01CBEC6055;
 Tue, 19 Nov 2019 16:23:22 +0000 (GMT)
Received: from [9.102.59.64] (unknown [9.102.59.64])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 19 Nov 2019 16:23:22 +0000 (GMT)
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
From: Gunnar Mills <gmills@linux.vnet.ibm.com>
Subject: Redfish OpenBMC OEM
Message-ID: <bec7abfa-8a69-3c8b-7985-dccb80d5c674@linux.vnet.ibm.com>
Date: Tue, 19 Nov 2019 10:23:21 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-19_05:2019-11-15,2019-11-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 bulkscore=0 phishscore=0 mlxlogscore=909 priorityscore=1501 clxscore=1011
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911190145
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
Cc: jason.m.bills@linux.intel.com, apparao.puli@linux.intel.com,
 james.feist@linux.intel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi All,

The process seems a little light for adding OpenBMC OEM Redfish 
properties and schemas. Can we establish a little more stringent process 
for adding these? Can we try to upstream these to the Redfish standard 
first before they are added as OpenBMC OEM? Do we need a design template 
or someway to collaborate before the OpenBMC OEM schema or properties 
are added? Are we okay if pretty architectural-specific or 
company-specific properties and schemas are under the "OpenBMC" OEM 
namespace?

I think a majority of the OEM properties in the "OpenBMC" OEM currently 
are things Redfish would take. I would like to see us engage Redfish first.

Some examples:
FirmwareProvisioningStatus, 
https://github.com/openbmc/bmcweb/commit/a6349918ad2c88533c6d09bb876812375a19f2c4

FanZones, 
https://github.com/openbmc/bmcweb/blob/a6349918ad2c88533c6d09bb876812375a19f2c4/static/redfish/v1/JsonSchemas/OemManager/index.json#L248

Thanks,
Gunnar

