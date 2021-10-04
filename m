Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F5D421274
	for <lists+openbmc@lfdr.de>; Mon,  4 Oct 2021 17:15:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNPRV3sCwz3bj2
	for <lists+openbmc@lfdr.de>; Tue,  5 Oct 2021 02:15:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=h+B6IGer;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=h+B6IGer; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNPR51wLVz2xsW
 for <openbmc@lists.ozlabs.org>; Tue,  5 Oct 2021 02:15:12 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 194EsbcL007195
 for <openbmc@lists.ozlabs.org>; Mon, 4 Oct 2021 11:15:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to :
 references : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=Rf5xQxu/oU0nm6YyHhIEqmMx2kklCXMssUqfDpfNgNA=;
 b=h+B6IGerUS+52rrRr0KbAM5sKDK6ou09tNwThzJID/Sg2QOn1X8NeE5W6HzASs/Wl+Ob
 8zvaHI0h1/GH2ZXamfw+zIoKRARMEW23PHDD+dfU1i5m4PkzC+pIttsnsn/17GmoFD8S
 xpM2ApqAm/X4ILhKmJ6OFjDs1RSyCUivMVb/VVACW0/DUf9nWqE6Fd3tq8jJPWE5byjy
 PiU8uFzK8bCmKb2ROxrMAb4GJwXDDLSO07zoPUFMoA1fc+HjQ2iy7K0IpLrl1/eFupQ0
 Eltj5nAh+0CXHbzAbUTvXwG5FuV0ZNfoDvVJOyy5HnM45KnOb/D6SGuvMA/q1jLFpa9V EQ== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3bg3991nh4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 04 Oct 2021 11:15:09 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 194FCRjI027464
 for <openbmc@lists.ozlabs.org>; Mon, 4 Oct 2021 15:15:09 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma01wdc.us.ibm.com with ESMTP id 3bef29yc52-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 04 Oct 2021 15:15:09 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 194FF8nf51577252
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Mon, 4 Oct 2021 15:15:08 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7C687AC060
 for <openbmc@lists.ozlabs.org>; Mon,  4 Oct 2021 15:15:08 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 58027AC062
 for <openbmc@lists.ozlabs.org>; Mon,  4 Oct 2021 15:15:08 +0000 (GMT)
Received: from demeter.local (unknown [9.160.14.168])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Mon,  4 Oct 2021 15:15:08 +0000 (GMT)
Subject: Re: Security Working Group meeting - Wednesday September 29
From: Joseph Reynolds <jrey@linux.ibm.com>
To: openbmc <openbmc@lists.ozlabs.org>
References: <bb3c031e-cbe3-36c5-0db6-d1ef454300fd@linux.ibm.com>
Message-ID: <e6dbbca0-e4f7-2e0f-146b-e57008a788e9@linux.ibm.com>
Date: Mon, 4 Oct 2021 10:15:07 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
In-Reply-To: <bb3c031e-cbe3-36c5-0db6-d1ef454300fd@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: P-ByEdv48LnHVfGajiWO8G0svAX7Ht0U
X-Proofpoint-ORIG-GUID: P-ByEdv48LnHVfGajiWO8G0svAX7Ht0U
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-04_04,2021-10-04_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 impostorscore=0 mlxscore=0
 clxscore=1015 bulkscore=0 mlxlogscore=352 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110040104
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

On 9/28/21 8:35 PM, Joseph Reynolds wrote:
> This is a reminder of the OpenBMC Security Working Group meeting 
> scheduled for this Wednesday September 29 at 10:00am PDT.
>
> We'll discuss the following items on the agenda 
> <https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI/edit>, 
> and anything else that comes up:
>
> 1. Continue discussion: Password based auth for IPMI over DTLS 
> https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/31548 
> <https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/31548>

DISCUSSION:

The planned IPMI over DLTS function will have certificate-based 
authuentication.  For our use cases, we would like to add password-based 
authentication, and we want to do so as securely as possible, meaning 
what protocol we should use.  In particular, we want to know if we 
should avoid sending a “cleartext” password (tunneled over DTLS) to the 
server.

However note the Redfish password authentication passes in the cleartext 
password to the Redfish/HTTP server (tunneled over HTTPS). Does not need 
the existing ipmi_pass file, or will at least store the password 
securely in it.

Contrast with Redfish password change and with Basic Auth.

Consider RAKP which does not require the password to be transmitted in 
cleartext.

Can we use consider SRP (dropped in OpenSSL 3.0 -- why?) or other 
implementations such as GnuTLS?

Want to know what protocol to use for password auth over DTLS.  And then 
implement it correctly.

TODO: Call for experts to weigh on.

> 2. (Joseph) Who wants a function to enable/disable BMC USB ports? 
> https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-dbus-interfaces/+/47180 
> <https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-dbus-interfaces/+/47180> 
>

What does disable USB port mean?  USB for BMC use.  [Discussion excludes 
host USB ports, and any USB ports further from the BMC.]

DISCUSSION:

Threats: USB protocol attack, power-based attack, epoxy-based DoS 
attacks, use of functions built on top of USB function.

Can disable ports independently: Does Redfish want to model topology?  
Sets of USB ports, such as those with physical external connectors, and 
internal.  ANSWER: Yes, see below.

Need to model topology (machine architecture, USB hubs, etc.) as part of 
understanding the issues?  Or can we partition USB ports and call it 
either BMC or host?

Consider essential connections such as USB-based BMC keyboards, 
USB-based BMC/host connections, etc.

The design is interested specifically in used-by-BMC external-to-the-box 
USB ports.

Note that if USB ports are needed for BMC recovery (such as a USB key), 
then disabling the USB will remove that recovery option.

Note: The U-Boot is an independent OS which may have access to a 
“disabled” BMC.

Where to disable USB ports?  In OpenBMC kernel?  In Uboot kernel (does 
not have support for USB?)?  Via pgood gpio?

What does the Redfish endpoint control?  TODO: Joseph to investigate.  
DONE:  After the meeting.  Notes:

Summary: Redfish models USB Controllers (as USBController),  USB Port 
Collections (as PortCollection), and USB Ports (as Port).  
Implementations who want to implement powering off ports can use the 
USBController Resource_PowerState schema.  Implementations who want to 
disable USB ports can use the USBController Resource_State schema or the 
Port Enabled property.


DETAILS: A Redfish USBController:

http://redfish.dmtf.org/schemas/v1/USBController.v1_0_0.yaml#/components/schemas/USBController_v1_0_0_USBController 
<http://redfish.dmtf.org/schemas/v1/USBController.v1_0_0.yaml#/components/schemas/USBController_v1_0_0_USBController>where 
properties include: Ports (PortCollection), Status (which can have a 
Resource_PowerState schema or a Resource_State schema (includes 
enabled/disabled))

Ref: https://redfish.dmtf.org/schemas/PortCollection.yaml 
<https://redfish.dmtf.org/schemas/PortCollection.yaml>has property 
Members which somehow presumably can get to a 
https://redfish.dmtf.org/schemas/Port.yaml 
<https://redfish.dmtf.org/schemas/Port.yaml>where Port_v1_5_0_Port has 
an “Enabled” property.


Do we need a custom OEM solution?

How do testers check if a USB port is disabled?  Power?  Signals?



>
>
> Access, agenda and notes are in the wiki:
> https://github.com/openbmc/openbmc/wiki/Security-working-group 
> <https://github.com/openbmc/openbmc/wiki/Security-working-group>
>
> - Joseph

