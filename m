Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 450F122ABD9
	for <lists+openbmc@lfdr.de>; Thu, 23 Jul 2020 11:37:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BC6gW4TYnzDqWt
	for <lists+openbmc@lfdr.de>; Thu, 23 Jul 2020 19:37:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=dkodihal@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BC6Kb6JfFzDr3M
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jul 2020 19:21:55 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06N92AaN101500; Thu, 23 Jul 2020 05:21:51 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32f292gts3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jul 2020 05:21:51 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06N9FQgX027272;
 Thu, 23 Jul 2020 09:21:49 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 32brq7p0cq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jul 2020 09:21:49 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06N9Llw026476896
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Jul 2020 09:21:47 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EAE2811C05B;
 Thu, 23 Jul 2020 09:21:46 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BD50911C04A;
 Thu, 23 Jul 2020 09:21:45 +0000 (GMT)
Received: from Deepaks-MacBook-Pro.local (unknown [9.79.239.140])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 23 Jul 2020 09:21:45 +0000 (GMT)
Subject: Re: Question about OpenBMC Remote BIOS configuration proposal
To: "Chang, Abner (HPS SW/FW Technologist)" <abner.chang@hpe.com>,
 "suryakanth.sekar@linux.intel.com" <suryakanth.sekar@linux.intel.com>
References: <CS1PR8401MB11440816B91B39DAD21E3CB2FF760@CS1PR8401MB1144.NAMPRD84.PROD.OUTLOOK.COM>
From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Message-ID: <687ea1e8-4abf-cc90-6777-a56a2416b08b@linux.vnet.ibm.com>
Date: Thu, 23 Jul 2020 14:51:44 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CS1PR8401MB11440816B91B39DAD21E3CB2FF760@CS1PR8401MB1144.NAMPRD84.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-23_02:2020-07-22,
 2020-07-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 impostorscore=0 mlxlogscore=851 suspectscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 mlxscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007230065
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
Cc: "Garrett, Mike \(HPE Server Firmware\)" <mike.garrett@hpe.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "Wu,
 Frank \(ISS Firmware\)" <frank.l.wu@hpe.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 23/07/20 2:04 pm, Chang, Abner (HPS SW/FW Technologist) wrote:
> Hi Sekar,
> This is Abner Chang from HPE Server BIOS team, our team is also working 
> on UEFI/EDK2 Redfish open source solution (just FYI the POC code is 
> almost done).
> 
> I read through the Remote BIOS configuration proposal and would like to 
> see if we still have chance to make some changes on it to reduce the 
> efforts on both BMC and BIOS. Also get rid of using PLDM BIOS 
> control/Configuration methodology because we can find the equivalent 
> method if use Redfish service.

The design describes PLDM as one of the alternatives, but it is not the 
only. The design talks about inband IPMI as well. In other words, the 
design doesn't mandate what inband communication protocol BIOS and BMC 
should use. On certain IBM systems, this protocol is PLDM.

Regards,
Deepak

