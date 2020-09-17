Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B038C26D4E6
	for <lists+openbmc@lfdr.de>; Thu, 17 Sep 2020 09:41:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BsTRY6KPnzDqWW
	for <lists+openbmc@lfdr.de>; Thu, 17 Sep 2020 17:41:13 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ratagupt@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=fbKgYZoC; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BsTQY3lG8zDqDd
 for <openbmc@lists.ozlabs.org>; Thu, 17 Sep 2020 17:40:17 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08H7XFgG041134
 for <openbmc@lists.ozlabs.org>; Thu, 17 Sep 2020 03:40:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type; s=pp1; bh=wktrxXiEN+kQGsvKG1a1TAcM4iXxR23GxtY8rMn+hGs=;
 b=fbKgYZoCpDCAPZ4NaW0kNcWk16tJriQ6QTpfdnvu3xy3E+tLDQVXpNEQeAeYq+TSqb94
 e7dRayo6P9Yk0wWkxf7Jqlzjjq6uhZl7CmF/fvyv0tspmYVSK/Uo5Bj0TYA0uSHkoqWB
 pZg2ph0k2u6/MTpZzCZFwWDKQfUAIKQKiE/xuBJky7dkJ6cvi/SfQsbj8DgIFmRFMeBn
 FV10INFLBWLHCIM87sWvDuSx2/OTkuvNpBzx1uS/vCMqXshVtrdg0Zlo9jf4vown2rzi
 L2CRKTsVaB+QMaJSPwD2VopGMave6i/gc1NPvJrnF3Knp627cfSFMw6p+a2NnOG3Ba9L Zw== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 33m37c0syp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 17 Sep 2020 03:40:14 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08H7bp5v018740
 for <openbmc@lists.ozlabs.org>; Thu, 17 Sep 2020 07:40:11 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 33ku33rrb4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 17 Sep 2020 07:40:11 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08H7e93s28049900
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Thu, 17 Sep 2020 07:40:09 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ADF31A4057
 for <openbmc@lists.ozlabs.org>; Thu, 17 Sep 2020 07:40:09 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A1C03A404D
 for <openbmc@lists.ozlabs.org>; Thu, 17 Sep 2020 07:40:07 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.85.148])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP
 for <openbmc@lists.ozlabs.org>; Thu, 17 Sep 2020 07:40:07 +0000 (GMT)
Subject: Re: Using bios-settings-mgr for setting hypervisor network attributes
To: openbmc@lists.ozlabs.org
References: <C9C88F03-4715-444E-9B1A-3834995458EA@getmailspring.com>
 <20200916172045.GD6152@heinlein>
 <CACWQX80BYYwPTN1PsbLfjFN5fQyjNGC1SxM9iyBKvxNiLh=WLQ@mail.gmail.com>
From: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Message-ID: <a5f0245d-703d-e0ba-0344-442c49a60cdf@linux.vnet.ibm.com>
Date: Thu, 17 Sep 2020 13:10:06 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CACWQX80BYYwPTN1PsbLfjFN5fQyjNGC1SxM9iyBKvxNiLh=WLQ@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------EE868A29087326026A015925"
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-17_03:2020-09-16,
 2020-09-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 spamscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 adultscore=0 clxscore=1011 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009170054
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
--------------EE868A29087326026A015925
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Pattrick, Ed,


We need to address the below two concerns with the existing settings infra.

  * Pending v/s configured value: Currently settings have single Dbus
    Object, Some properties which is for host firmware we need to have
    two placeholders one for Pending values and one for Configured
    values. Bios settings have this concept.
      o Should we add two Dbus objects in settings infra?
  * Dynamic Dbus objects: Currently settings infrastructure is only for
    static objects, Objects which gets added on runtime, settings infra
    doesn't support that.
      o Eg: IP address on ethernet interface is dynamic in nature, An
        ethernet interface can have multiple IP address on it.
        considering if SLAAC is enabled(ipV6).
      o Seems this problem is common for both(settings v/s bios-settings)

Regards
Ratan Gupta


On 9/16/20 11:14 PM, Ed Tanous wrote:
> On Wed, Sep 16, 2020 at 10:20 AM Patrick Williams <patrick@stwcx.xyz> wrote:
>> On Wed, Sep 16, 2020 at 08:17:01PM +0530, manoj kiran wrote:
>>> Hi Ed & James,
>>>
>>> Till now IBM was using phosphor-settings infrastructure as back-end and uses Ethernet Schema for Hypervisor computer system(hypervisor_ethernet.hpp) for setting the IP address of hypervisor. And now we are planning to leverage the capabilities of bios-settings-mgr(backend) as well to set the hypervisor attributes.
>>> do you see any concerns here ?
>>> Thanks,
>>> Manoj
>> These end up being two quite different implementations from a dbus
>> perspective, which could have implications to Redfish and webui users.
>>
>> With 'settings' there is no generic settings interfacess on dbus; every
>> setting is required to have some modeled interface.  This is great when
>> you are exposing some hypervisor setting that the BMC also has for
>> itself, such as network.  We have a single dbus interface for all
>> network end-points and it doesn't matter if it is for the BMC or the
>> Hypervisor.
>>
>> With 'bios-settings-mgr' there are only generic free-form settings
>> values, which presently can be either int64 or string[1].
> If this is correct, then I withdraw my support.  I had assumed
> bios-settings-mgr would host several objects that contain an
> EthernetInterface [1] api, similar to what phosphor-networkd does, and
> whose endpoints require no new code in most of the endpoints.  If
> we're talking about moving all this to a simple key-value store,
> running on yet another representation of what a network interface
> looks like, that's going in the wrong direction in terms of fidelity
> and complexity.
>
> With that said, if I'm mistaken, let me know.
>
>>   This means
>> there is no overlap with any similar settings we have on the BMC and
>> there is no programatic way to ensure the data is of the right type and
>> named with the right key.  This approach is better when you have large
>> numbers of attributes for concepts which the BMC doesn't have itself.
>>
>> My understanding was that the 'bios-settings-mgr' was typically going to be
>> used for uploading a large blob of configuration values and the external
>> interfaces would have fairly minimal code related to individual
>> settings.  My concern with using 'bios-settings-mgr' in general is that
>> it will end up being very tight coupling between external interfaces
>> (Redfish / webui) and BIOS implementations.  When you use 'settings',
>> you can implement much more generic external interface code and likely
>> limit the coupling, if any, to the PLDM provider.
> I think we have one benefit here in that there's going to be several
> implementations of the bios-settings-mgr for the various bios
> implementations that will keep us more "honest" about our APIs.  It's
> not a satisfying answer, I realize, but I think it's the best we can
> do at the moment.
>
>> Net is, if you're expecting to be able to modify hypervisor values
>> through Redfish or WebUI, I think the best approach is to use
>> 'settings'.
> The problem with the "settings" approach becomes error handling.
> Settingsd has no context of a transaction, or a backend on the other
> side, so when and if things fail, they fail silently, or possibly with
> a log.  In the case of hosting this API in the BIOS daemon, it can
> actually do the "commit" of the parameters to BIOS as part of the dbus
> transaction, so once the return code is received from the method call,
> the user can know that the values were "latched", and can knowingly
> move on.  If they weren't latched, the client can know if it makes
> sense to retry, or do some other procedure.
> This also has nice properties for the BMC, as it never has to "own"
> storage of the data, nor does it have to implement all the validation
> routines, as it can rely on the actual data owner to do so.
>
>> 1. https://github.com/openbmc/phosphor-dbus-interfaces/blob/77a742627edde54aec625d7c1a200d9f4832f0ba/xyz/openbmc_project/BIOSConfig/Manager.interface.yaml#L44
>>
>> --
>> Patrick Williams
> 1. https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/Network/EthernetInterface.interface.yaml

--------------EE868A29087326026A015925
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <tt>Hi Pattrick, Ed,</tt><tt><br>
    </tt><tt><br>
    </tt><tt><br>
    </tt><tt>We need to address the below two concerns with the existing
      settings infra.</tt>
    <ul>
      <li><tt>Pending v/s configured value: Currently settings have
          single Dbus Object, </tt><tt><tt> Some properties which is
            for host firmware we need to have </tt><tt>two placeholders
            one </tt>for Pending values and one for Configured values.
        </tt><tt>Bios settings have this concept.<br>
        </tt></li>
      <ul>
        <li><tt>Should we add two Dbus objects in settings infra?</tt><tt><br>
          </tt></li>
      </ul>
      <li><tt>Dynamic Dbus objects: Currently settings infrastructure is
          only for static objects, Objects which gets added on runtime,
          settings infra doesn't support that.</tt></li>
      <ul>
        <li><tt>Eg: IP address on ethernet interface is dynamic in
            nature, An ethernet interface can have multiple IP address
            on it. considering if SLAAC is enabled(ipV6).</tt></li>
        <li><tt>Seems this problem is common for both(settings v/s
            bios-settings)</tt><tt><br>
          </tt></li>
      </ul>
    </ul>
    <tt>Regards</tt><tt><br>
    </tt><tt>Ratan Gupta</tt><br>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/16/20 11:14 PM, Ed Tanous wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CACWQX80BYYwPTN1PsbLfjFN5fQyjNGC1SxM9iyBKvxNiLh=WLQ@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">On Wed, Sep 16, 2020 at 10:20 AM Patrick Williams <a class="moz-txt-link-rfc2396E" href="mailto:patrick@stwcx.xyz">&lt;patrick@stwcx.xyz&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
On Wed, Sep 16, 2020 at 08:17:01PM +0530, manoj kiran wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Hi Ed &amp; James,

Till now IBM was using phosphor-settings infrastructure as back-end and uses Ethernet Schema for Hypervisor computer system(hypervisor_ethernet.hpp) for setting the IP address of hypervisor. And now we are planning to leverage the capabilities of bios-settings-mgr(backend) as well to set the hypervisor attributes.
do you see any concerns here ?
Thanks,
Manoj
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
These end up being two quite different implementations from a dbus
perspective, which could have implications to Redfish and webui users.

With 'settings' there is no generic settings interfacess on dbus; every
setting is required to have some modeled interface.  This is great when
you are exposing some hypervisor setting that the BMC also has for
itself, such as network.  We have a single dbus interface for all
network end-points and it doesn't matter if it is for the BMC or the
Hypervisor.

With 'bios-settings-mgr' there are only generic free-form settings
values, which presently can be either int64 or string[1].
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
If this is correct, then I withdraw my support.  I had assumed
bios-settings-mgr would host several objects that contain an
EthernetInterface [1] api, similar to what phosphor-networkd does, and
whose endpoints require no new code in most of the endpoints.  If
we're talking about moving all this to a simple key-value store,
running on yet another representation of what a network interface
looks like, that's going in the wrong direction in terms of fidelity
and complexity.

With that said, if I'm mistaken, let me know.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap=""> This means
there is no overlap with any similar settings we have on the BMC and
there is no programatic way to ensure the data is of the right type and
named with the right key.  This approach is better when you have large
numbers of attributes for concepts which the BMC doesn't have itself.

My understanding was that the 'bios-settings-mgr' was typically going to be
used for uploading a large blob of configuration values and the external
interfaces would have fairly minimal code related to individual
settings.  My concern with using 'bios-settings-mgr' in general is that
it will end up being very tight coupling between external interfaces
(Redfish / webui) and BIOS implementations.  When you use 'settings',
you can implement much more generic external interface code and likely
limit the coupling, if any, to the PLDM provider.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I think we have one benefit here in that there's going to be several
implementations of the bios-settings-mgr for the various bios
implementations that will keep us more "honest" about our APIs.  It's
not a satisfying answer, I realize, but I think it's the best we can
do at the moment.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Net is, if you're expecting to be able to modify hypervisor values
through Redfish or WebUI, I think the best approach is to use
'settings'.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
The problem with the "settings" approach becomes error handling.
Settingsd has no context of a transaction, or a backend on the other
side, so when and if things fail, they fail silently, or possibly with
a log.  In the case of hosting this API in the BIOS daemon, it can
actually do the "commit" of the parameters to BIOS as part of the dbus
transaction, so once the return code is received from the method call,
the user can know that the values were "latched", and can knowingly
move on.  If they weren't latched, the client can know if it makes
sense to retry, or do some other procedure.
This also has nice properties for the BMC, as it never has to "own"
storage of the data, nor does it have to implement all the validation
routines, as it can rely on the actual data owner to do so.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
1. <a class="moz-txt-link-freetext" href="https://github.com/openbmc/phosphor-dbus-interfaces/blob/77a742627edde54aec625d7c1a200d9f4832f0ba/xyz/openbmc_project/BIOSConfig/Manager.interface.yaml#L44">https://github.com/openbmc/phosphor-dbus-interfaces/blob/77a742627edde54aec625d7c1a200d9f4832f0ba/xyz/openbmc_project/BIOSConfig/Manager.interface.yaml#L44</a>

--
Patrick Williams
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
1. <a class="moz-txt-link-freetext" href="https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/Network/EthernetInterface.interface.yaml">https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/Network/EthernetInterface.interface.yaml</a>
</pre>
    </blockquote>
  </body>
</html>

--------------EE868A29087326026A015925--

