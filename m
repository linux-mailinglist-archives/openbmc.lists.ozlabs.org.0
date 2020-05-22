Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D721DEFC6
	for <lists+openbmc@lfdr.de>; Fri, 22 May 2020 21:12:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49TGM24nxXzDqd3
	for <lists+openbmc@lfdr.de>; Sat, 23 May 2020 05:11:58 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=gmills@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49TGGb1z4XzDqyG
 for <openbmc@lists.ozlabs.org>; Sat, 23 May 2020 05:08:06 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04MJ3B27179086
 for <openbmc@lists.ozlabs.org>; Fri, 22 May 2020 15:08:03 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3160mbx69a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 22 May 2020 15:08:03 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 04MJ0Y9T000419
 for <openbmc@lists.ozlabs.org>; Fri, 22 May 2020 19:08:02 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma02dal.us.ibm.com with ESMTP id 313whc1b0x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 22 May 2020 19:08:02 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 04MJ81u552953404
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Fri, 22 May 2020 19:08:01 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B4787B205F
 for <openbmc@lists.ozlabs.org>; Fri, 22 May 2020 19:08:01 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D6A17B206E
 for <openbmc@lists.ozlabs.org>; Fri, 22 May 2020 19:08:00 +0000 (GMT)
Received: from [9.81.204.198] (unknown [9.81.204.198])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP
 for <openbmc@lists.ozlabs.org>; Fri, 22 May 2020 19:08:00 +0000 (GMT)
From: Gunnar Mills <gmills@linux.vnet.ibm.com>
Subject: Redfish client use case for Software Image ExtendedVersion?
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Message-ID: <978080df-7d52-b204-5102-b2a9b4405050@linux.vnet.ibm.com>
Date: Fri, 22 May 2020 14:07:58 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------E09636E891639329A78011C9"
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-22_07:2020-05-22,
 2020-05-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 cotscore=-2147483648 malwarescore=0 suspectscore=0 adultscore=0
 mlxlogscore=999 bulkscore=0 impostorscore=0 mlxscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005220150
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

This is a multi-part message in MIME format.
--------------E09636E891639329A78011C9
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Anyone have a Redfish client use case for Software Image ExtendedVersion 
or see value in it being added to Redfish?

Was attempting to get ExtendedVersion added to Redfish's 
SoftwareInventory schema but Redfish did not see an "end-user / standard 
use cases". IBM's use case is mostly for development and Redfish's 
feedback was "single implementation can utilize OEM easily". If someone 
else has a need, will pass that on to Redfish and hopefully that will be 
enough to get it added to the schema.

Some background:
ExtendedVersion - "Extended version of the level.". A value from an 
OpenPOWER system:
"ExtendedVersion": 
"buildroot-2019.05.3-17-g522600d,skiboot-v6.5-242-ge19dddc5-p37cfc70,hostboot-820a099-pe030f7b,occ-3ab2921,linux-5.4.25-openpower1-p2339fe8,petitboot-v1.12,machine-xml-0f9b366-p7fb7a8d,hostboot-binaries-hw013120a.opmst,capp-ucode-p9-dd2-v4,sbe-0a77603,hcode-hw031620a.opmst"

More information:
https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/Software/ExtendedVersion.interface.yaml
https://redfish.dmtf.org/schemas/SoftwareInventory.v1_3_0.json
https://redfishforum.com/thread/301/firmware-extended-version
Some additional discussion (summarized above) in Redfish issue #4000.*
*You must have access to the private Redfish repo to view.

Thanks!
Gunnar


--------------E09636E891639329A78011C9
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Anyone have a Redfish client use case for Software Image
      ExtendedVersion or see value in it being added to Redfish?<br>
      <br>
      Was attempting to get ExtendedVersion added to Redfish's
      SoftwareInventory schema but Redfish did not see an "end-user /
      standard use cases". IBM's use case is mostly for development and
      Redfish's feedback was "single implementation can utilize OEM
      easily". If someone else has a need, will pass that on to Redfish
      and hopefully that will be enough to get it added to the schema.  
      <br>
      <br>
      Some background:<br>
      ExtendedVersion - "<span class="pl-s">Extended version of the
        level.</span>". A value from an OpenPOWER system: <br>
      "ExtendedVersion":
"buildroot-2019.05.3-17-g522600d,skiboot-v6.5-242-ge19dddc5-p37cfc70,hostboot-820a099-pe030f7b,occ-3ab2921,linux-5.4.25-openpower1-p2339fe8,petitboot-v1.12,machine-xml-0f9b366-p7fb7a8d,hostboot-binaries-hw013120a.opmst,capp-ucode-p9-dd2-v4,sbe-0a77603,hcode-hw031620a.opmst"<br>
      <br>
      More information:<br>
<a class="moz-txt-link-freetext" href="https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/Software/ExtendedVersion.interface.yaml">https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/Software/ExtendedVersion.interface.yaml</a><br>
      <a class="moz-txt-link-freetext" href="https://redfish.dmtf.org/schemas/SoftwareInventory.v1_3_0.json">https://redfish.dmtf.org/schemas/SoftwareInventory.v1_3_0.json</a><br>
      <a class="moz-txt-link-freetext" href="https://redfishforum.com/thread/301/firmware-extended-version">https://redfishforum.com/thread/301/firmware-extended-version</a><br>
      Some additional discussion (summarized above) in Redfish issue
      #4000.* <br>
      *You must have access to the private Redfish repo to view. <br>
      <br>
      Thanks!<br>
      Gunnar<br>
    </p>
  </body>
</html>

--------------E09636E891639329A78011C9--

