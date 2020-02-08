Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 885BE156368
	for <lists+openbmc@lfdr.de>; Sat,  8 Feb 2020 09:28:59 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48F5145Cl3zDqcm
	for <lists+openbmc@lfdr.de>; Sat,  8 Feb 2020 19:28:56 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=dkodihal@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48F50L6pYWzDqcT
 for <openbmc@lists.ozlabs.org>; Sat,  8 Feb 2020 19:28:17 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0188P1Yc128752
 for <openbmc@lists.ozlabs.org>; Sat, 8 Feb 2020 03:28:13 -0500
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2y1pt2ktv8-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Sat, 08 Feb 2020 03:28:13 -0500
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <dkodihal@linux.vnet.ibm.com>;
 Sat, 8 Feb 2020 08:28:11 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Sat, 8 Feb 2020 08:28:08 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0188S7ds55443572
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Sat, 8 Feb 2020 08:28:07 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B600D11C054
 for <openbmc@lists.ozlabs.org>; Sat,  8 Feb 2020 08:28:07 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AF64A11C04A
 for <openbmc@lists.ozlabs.org>; Sat,  8 Feb 2020 08:28:06 +0000 (GMT)
Received: from Deepaks-MacBook-Pro.local (unknown [9.85.75.175])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP
 for <openbmc@lists.ozlabs.org>; Sat,  8 Feb 2020 08:28:06 +0000 (GMT)
From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Subject: Exposing BIOS attributes to a remote management console
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Date: Sat, 8 Feb 2020 13:58:04 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 20020808-0016-0000-0000-000002E4EE56
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20020808-0017-0000-0000-00003347DADC
Message-Id: <7622d97a-13f2-8c38-6ae8-9325923c3c83@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-07_06:2020-02-07,
 2020-02-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 spamscore=0 malwarescore=0 phishscore=0 mlxscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 mlxlogscore=964 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002080070
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

To enable remote updates (via a remote management console that talks to 
the BMC) to the host firmware's BIOS settings table on IBM systems, 
we're thinking of the following flow:

a) The host firmware sends down a BIOS settings table to the BMC using 
PLDM [1].
b) The BMC uses phosphor-settingsd [2] as the backend to store BIOS 
attributes on D-Bus.
c) Bmcweb implements the Redfish BIOS schema [3] to enable remote 
reads/writes on the BIOS attributes.

However, c) is a problem because one needs to write YAML files [4] for 
the BMC to determine what D-Bus objects to make corresponding to the 
BIOS attributes. This requires a unique D-Bus interface *per* BIOS 
attribute. This means the BMC must have prior knowledge about the BIOS 
attributes.

I don't think that's the right way to go about this for two reasons. One 
- this creates a lockstep dependency on the host firmware when the BIOS 
settings table needs to be updated, and two - I think the OpenBMC 
implementation of this must be able to receive (via PLDM/IPMI/other 
standard in-band means) a set of BIOS attributes from different BIOS 
firmware stacks dynamically and expose them for out of band updates, 
without having prior/build-time knowledge of those attributes. So I 
think this calls for a different kind of D-Bus interface/infrastructure 
than what the phosphor-settingsd app relies on. Something that enables 
the BMC to add to D-Bus a BIOS attribute dynamically, knowing it's name, 
type and default value.

Any thoughts on this flow? I'm also curious to know if the Redfish BIOS 
schema/attribute registry model requires the BMC to have prior knowledge 
about the system BIOS attributes to update the registry. This wasn't 
obvious to me from a quick read of the schema.

Thanks,
Deepak

[1] 
https://www.dmtf.org/sites/default/files/standards/documents/DSP0247_1.0.0.pdf
[2] https://github.com/openbmc/phosphor-settingsd
[3] https://redfish.dmtf.org/schemas/v1/Bios.v1_1_0.json
[4] 
https://github.com/openbmc/openbmc/blob/master/meta-phosphor/recipes-phosphor/settings/phosphor-settings-defaults/defaults.yaml

