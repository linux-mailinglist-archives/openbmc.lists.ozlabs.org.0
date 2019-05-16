Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6301FF9A
	for <lists+openbmc@lfdr.de>; Thu, 16 May 2019 08:36:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 454MCH55XmzDqbm
	for <lists+openbmc@lfdr.de>; Thu, 16 May 2019 16:36:43 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=dkodihal@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 454MBj1fGpzDqJs
 for <openbmc@lists.ozlabs.org>; Thu, 16 May 2019 16:36:12 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4G6Xqrc118665
 for <openbmc@lists.ozlabs.org>; Thu, 16 May 2019 02:36:09 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2sh0byneq2-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 16 May 2019 02:36:08 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <dkodihal@linux.vnet.ibm.com>;
 Thu, 16 May 2019 07:36:07 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 16 May 2019 07:36:03 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4G6a2as44630064
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 May 2019 06:36:02 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A6B0DA405C;
 Thu, 16 May 2019 06:36:02 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 33C52A4062;
 Thu, 16 May 2019 06:36:02 +0000 (GMT)
Received: from Deepaks-MacBook-Pro.local (unknown [9.199.203.20])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 16 May 2019 06:36:02 +0000 (GMT)
Subject: Re: Add support to debug unresponsive host
To: Jayanth Othayoth <ojayanth@gmail.com>
References: <CACkAXSqktuOVy02_R9q4iWcTL=_v7iOrxoBOOCMb5xTAXnxREg@mail.gmail.com>
From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Date: Thu, 16 May 2019 12:06:01 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CACkAXSqktuOVy02_R9q4iWcTL=_v7iOrxoBOOCMb5xTAXnxREg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19051606-0008-0000-0000-000002E733D9
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19051606-0009-0000-0000-00002253D719
Message-Id: <c8826cab-42d1-85d7-4eb0-50e79857a205@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-16_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905160046
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 15/05/19 6:09 PM, Jayanth Othayoth wrote:
> ## Problem Description
> Issue #457:  Add support to debug unresponsive host.
> 
> Scope: High level design direction to solve this problem,
> 
> ## Background and References
> There are situation at customer places where OPAL/Linux goes 
> unresponsive causing a system hang. And there is no way to figure out 
> what went wrong with Linux kernel or OPAL. Looking for a way to trigger 
> a dump capture on Linux host so that we can capture the OS dump for post 
> analysis.
> 
> ## Proposed Design for POWER processor based systems:
> Get all Host CPUs in reset vector and Linux then has a mechanism to 
> patch it into panic-kdump path to trigger dump capture. This will enable 
> us to analyze and fix customer issue where we see Linux hang and 
> unresponsive system.
> 
> ### Redfish Schema used:
> * Reference: DSP2046 2018.3,
> * ComputerSystem 1.6.0 schema provides an action called 
> #ComputerSystem.Reset”, This action is used to reset the system. 
> ResetType parameter is used  for indicating type of reset need to be 
> performed. In this use case we can use “Nmi” type
>      * Nmi: Generate a Diagnostic Interrupt (usually an NMI on x86 
> systems) to cease normal operations, perform diagnostic actions and 
> typically halt the system.  
> * ### d-bus :
> 
> Option 1:   Extending  the existing  d-bus interface  state.Host  name 
> space ( 
> /openbmc/phosphor-dbus-interfaces/xyz/openbmc_project/State/Host.interface.yaml 
> ) to support new RequestedHostTransition property called  “Nmi”.   d-bus 
> backend can internally invoke processor specific target to do Sreset( 
> equivalent to x86 NMI) and associated  actions.

I don't prefer this option, because this would mean adding host specific 
code in phoshor-state-manager, which I think until now is host agnostic. 
So for that reason, Option 2 sounds better. There are some good 
questions from Neeraj as well, so I would suggest adding this as a 
design template on Gerrit to gather better feedback.

Thanks,
Deepak

> Option 2: Introducing new d-bus interface in the control.state namespace 
> ( 
> /openbmc/phosphor-dbus-interfaces/xyz/openbmc_project/Control/Host/NMI.interface.yaml) 
> namespace and implement the new d-bus back-end for respective  processor 
> specific targets.

