Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 29BF6273E29
	for <lists+openbmc@lfdr.de>; Tue, 22 Sep 2020 11:10:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BwbB35gFlzDqxq
	for <lists+openbmc@lfdr.de>; Tue, 22 Sep 2020 19:10:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ratagupt@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=GuLAvdRY; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bwb8p4RtZzDqpM
 for <openbmc@lists.ozlabs.org>; Tue, 22 Sep 2020 19:09:14 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08M91wXq020049; Tue, 22 Sep 2020 05:09:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type; s=pp1; bh=RhqdJCpZzoV0ql6sx0D+O74Z94b/PnSDrZ9RSjlGImc=;
 b=GuLAvdRYNZ3D4SUgr76Cnz9Mt8QSgLMztjEPsM+IXFtvwYsOynDI2cPDwdJmDQ5iXMbF
 Ix7wonXZXdroNhTNRqL7s2a7p1kq6AeRD3aWbGJ0SDzZLEhfJB+T0wFQeDIHWAmqcj4E
 eFJh1SKNlPNNqrOVftImz9nCJjKeEX9KWs/mPFodRzB0zKGW0q+DIMLXR2iJtDhOpLZY
 nhdnbQL3URK4eWty9kBz+lE3i9kZp+i3g+vzO7owB5cxvOjsbvQkp+j3vZ03T3FOgAsu
 TENgOSNPOd3ky/ksjN79QZvbiv1qO/stQrhkhRZUeoJ5NffZEHVln14nIPSqGmZXPK0T 7Q== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33qe3hggh4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Sep 2020 05:09:11 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08M98XOL032534;
 Tue, 22 Sep 2020 09:09:09 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03fra.de.ibm.com with ESMTP id 33p1f3s1ds-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Sep 2020 09:09:08 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 08M97V5Z25756102
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Sep 2020 09:07:31 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A01CF4C04A;
 Tue, 22 Sep 2020 09:09:06 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 901744C04E;
 Tue, 22 Sep 2020 09:09:05 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.199.39.138])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 22 Sep 2020 09:09:05 +0000 (GMT)
Subject: Re: Using bios-settings-mgr for setting hypervisor network attributes
To: openbmc@lists.ozlabs.org, Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>, 
 Patrick Williams <patrick@stwcx.xyz>, Ed Tanous <ed@tanous.net>
References: <C9C88F03-4715-444E-9B1A-3834995458EA@getmailspring.com>
 <20200916172045.GD6152@heinlein>
 <CACWQX80BYYwPTN1PsbLfjFN5fQyjNGC1SxM9iyBKvxNiLh=WLQ@mail.gmail.com>
 <a5f0245d-703d-e0ba-0344-442c49a60cdf@linux.vnet.ibm.com>
 <20200917153601.GH6152@heinlein>
 <c007630e-54e2-df13-e6da-0af0b2998279@linux.vnet.ibm.com>
From: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Message-ID: <e7dc17f5-191c-b24f-4b92-1020cf77a54a@linux.vnet.ibm.com>
Date: Tue, 22 Sep 2020 14:39:04 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <c007630e-54e2-df13-e6da-0af0b2998279@linux.vnet.ibm.com>
Content-Type: multipart/alternative;
 boundary="------------2F46F34602DACEBD56A6A2CE"
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-22_06:2020-09-21,
 2020-09-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 priorityscore=1501 bulkscore=0 adultscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1011 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009220071
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
--------------2F46F34602DACEBD56A6A2CE
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

Hi All,

Adding one more problem here with settings infra and with some proposed 
solutions.

Problem Domain:

       - With multi property update from redfish , webserver updates the 
settings object
       - PLDM on bmc listens on the property update of settings object 
and notifies to Hypervisor
       - As there can be multiple properties in single PATCH operation, 
PLDM on bmc sends
         multiple Notifications to Hypervisor
       - Specifically in case of network config,  single property update 
on phyp may lead to network inconsistency.

How can we solve this?

  * Proposal 1: Add one more property in the settings Dbus object itself
    which tells that it is ready to be read, PLDM on the BMC watching on
    that property and read the whole network configuration and notifies
    Hypervisor.

  * Proposal 2: Hypervisor runs the timer if the bios attr belongs to
    network configuration and once the timer expires,it reads the bios
    attr related to network and applies it.

  * Proposal 3: Add one more bios attribute in the bios table which
    tells that Bios configuration can be read and applied by the
    Hypervisor for the network configuration.


   Looking for suggestion what could be the best way here?

Ratan

On 9/19/20 11:11 AM, Ratan Gupta wrote:
>
> On 9/17/20 9:06 PM, Patrick Williams wrote:
>> On Thu, Sep 17, 2020 at 01:10:06PM +0530, Ratan Gupta wrote:
>>> We need to address the below two concerns with the existing settings 
>>> infra.
>> Both of these seem like missing features based on our now greater
>> understanding of the problem domain from where we were 3-4 years ago
>> when phosphor-settings-manager was originally written, right? That
>> doesn't seem like a good reason to entirely throw out the approach.
>>
>>>    * Pending v/s configured value: Currently settings have single Dbus
>>>      Object, Some properties which is for host firmware we need to have
>>>      two placeholders one for Pending values and one for Configured
>>>      values. Bios settings have this concept.
>>>        o Should we add two Dbus objects in settings infra?
>> This was going to be my suggestion, yes.  You could have two sets of the
>> objects: current and pending.  'current' objects may not be written by
>> dbus-clients.  These are the same terms used by the BIOSConfig proposal.
> Thanks Patrick, seems reasonable to have two D-bus objects.
>>
>> What I am not seeing in BIOSConfig and is equally applicable here is
>> _when_ pending is applied to current.  You will need some interface that
>> IPMI / PLDM can call to apply those settings?  Or, do you monitor host
>> state signals automatically?
>>
>>>    * Dynamic Dbus objects: Currently settings infrastructure is only 
>>> for
>>>      static objects, Objects which gets added on runtime, settings 
>>> infra
>>>      doesn't support that.
>>>        o Eg: IP address on ethernet interface is dynamic in nature, An
>>>          ethernet interface can have multiple IP address on it.
>>>          considering if SLAAC is enabled(ipV6).
>>>        o Seems this problem is common for both(settings v/s 
>>> bios-settings)
>> I assume these would be requested for creation by IPMI / PLDM? We could
>> use a similar model to xyz.openbmc_project.Inventory.Manager where
>> objects are requested for creation dynamically through a method.
> We don't have this requirement now but in near future it is going to
> be there, we can improve the settings infra to support this.
>>

--------------2F46F34602DACEBD56A6A2CE
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;
      charset=windows-1252">
  </head>
  <body>
    <p>Hi All,</p>
    <p>Adding one more problem here with settings infra and with some
      proposed solutions.<br>
    </p>
    <p>Problem Domain:</p>
    <p>      - With multi property update from redfish , webserver
      updates the settings object<br>
            - PLDM on bmc listens on the property update of settings
      object and notifies to Hypervisor<br>
            - As there can be multiple properties in single PATCH
      operation, PLDM on bmc sends<br>
              multiple Notifications to Hypervisor<br>
            - Specifically in case of network config,  single property
      update on phyp may lead to network inconsistency.<br>
      <br>
      How can we solve this?</p>
    <ul>
      <li>Proposal 1: Add one more property in the settings Dbus object
        itself which tells that it is ready to be read, PLDM on the BMC
        watching on that property and read the whole network
        configuration and notifies Hypervisor.</li>
    </ul>
    <ul>
      <li>Proposal 2: Hypervisor runs the timer if the bios attr belongs
        to network configuration and once the timer expires,it reads the
        bios attr related to network and applies it.</li>
    </ul>
    <ul>
      <li>Proposal 3: Add one more bios attribute in the bios table
        which tells that Bios configuration can be read and applied by
        the Hypervisor for the network configuration. <br>
      </li>
    </ul>
    <p><br>
        Looking for suggestion what could be the best way here?<br>
    </p>
    <p>Ratan</p>
    <div class="moz-cite-prefix">On 9/19/20 11:11 AM, Ratan Gupta wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:c007630e-54e2-df13-e6da-0af0b2998279@linux.vnet.ibm.com">
      <br>
      On 9/17/20 9:06 PM, Patrick Williams wrote:
      <br>
      <blockquote type="cite">On Thu, Sep 17, 2020 at 01:10:06PM +0530,
        Ratan Gupta wrote:
        <br>
        <blockquote type="cite">We need to address the below two
          concerns with the existing settings infra.
          <br>
        </blockquote>
        Both of these seem like missing features based on our now
        greater
        <br>
        understanding of the problem domain from where we were 3-4 years
        ago
        <br>
        when phosphor-settings-manager was originally written, right? 
        That
        <br>
        doesn't seem like a good reason to entirely throw out the
        approach.
        <br>
        <br>
        <blockquote type="cite">   * Pending v/s configured value:
          Currently settings have single Dbus
          <br>
               Object, Some properties which is for host firmware we
          need to have
          <br>
               two placeholders one for Pending values and one for
          Configured
          <br>
               values. Bios settings have this concept.
          <br>
                 o Should we add two Dbus objects in settings infra?
          <br>
        </blockquote>
        This was going to be my suggestion, yes.  You could have two
        sets of the
        <br>
        objects: current and pending.  'current' objects may not be
        written by
        <br>
        dbus-clients.  These are the same terms used by the BIOSConfig
        proposal.
        <br>
      </blockquote>
      Thanks Patrick, seems reasonable to have two D-bus objects.
      <br>
      <blockquote type="cite">
        <br>
        What I am not seeing in BIOSConfig and is equally applicable
        here is
        <br>
        _when_ pending is applied to current.  You will need some
        interface that
        <br>
        IPMI / PLDM can call to apply those settings?  Or, do you
        monitor host
        <br>
        state signals automatically?
        <br>
        <br>
        <blockquote type="cite">   * Dynamic Dbus objects: Currently
          settings infrastructure is only for
          <br>
               static objects, Objects which gets added on runtime,
          settings infra
          <br>
               doesn't support that.
          <br>
                 o Eg: IP address on ethernet interface is dynamic in
          nature, An
          <br>
                   ethernet interface can have multiple IP address on
          it.
          <br>
                   considering if SLAAC is enabled(ipV6).
          <br>
                 o Seems this problem is common for both(settings v/s
          bios-settings)
          <br>
        </blockquote>
        I assume these would be requested for creation by IPMI / PLDM? 
        We could
        <br>
        use a similar model to xyz.openbmc_project.Inventory.Manager
        where
        <br>
        objects are requested for creation dynamically through a method.
        <br>
      </blockquote>
      We don't have this requirement now but in near future it is going
      to
      <br>
      be there, we can improve the settings infra to support this.
      <br>
      <blockquote type="cite">
        <br>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------2F46F34602DACEBD56A6A2CE--

