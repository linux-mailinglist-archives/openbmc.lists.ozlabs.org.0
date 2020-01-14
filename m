Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6120613AE10
	for <lists+openbmc@lfdr.de>; Tue, 14 Jan 2020 16:55:12 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47xw5T4LWPzDqQC
	for <lists+openbmc@lfdr.de>; Wed, 15 Jan 2020 02:55:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=richard.marian.thomaiyar@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47xw4h036GzDqP6
 for <openbmc@lists.ozlabs.org>; Wed, 15 Jan 2020 02:54:26 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Jan 2020 07:54:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,433,1571727600"; 
 d="scan'208,217";a="213371881"
Received: from rthomaiy-mobl2.gar.corp.intel.com (HELO [10.252.88.89])
 ([10.252.88.89])
 by orsmga007.jf.intel.com with ESMTP; 14 Jan 2020 07:54:17 -0800
Subject: Re: MCTP over PCI on AST2500
To: "Khetan, Sharad" <sharad.khetan@intel.com>, Jeremy Kerr <jk@ozlabs.org>
References: <gqnvvFdbRiXJzS3sVr0pSSo8kD6KjPbFMgg8CV1tsi0cKt0zT5mrnSTfBB1cpiOt-MVrXNzlg95DqgWZ3AxD8zOyEbFYRykqjP-DxEW4Mww=@protonmail.com>
 <037D4669-D49C-4DF8-B49B-4F3BD97451AE@fb.com>
 <865C376D1B77624AAA570EFEF73CE52F9E08757B@fmsmsx118.amr.corp.intel.com>
 <3502e928-40c5-41d9-9ff1-5aa199e0e31b@www.fastmail.com>
 <865C376D1B77624AAA570EFEF73CE52F9E0E4E3E@fmsmsx118.amr.corp.intel.com>
 <8a1fc80f-9d25-4c38-bdcd-df05c4194fe7@www.fastmail.com>
 <62036de3-ce3d-4ccb-ac5b-15e9ba39d22b@www.fastmail.com>
 <865C376D1B77624AAA570EFEF73CE52F9E10C8FD@fmsmsx118.amr.corp.intel.com>
 <92f857cc-303a-0d50-e0e4-2de2a8d19e41@linux.vnet.ibm.com>
 <865C376D1B77624AAA570EFEF73CE52F9E10E9A5@fmsmsx118.amr.corp.intel.com>
 <22A3B800-F833-4615-B980-EE933E1F83A9@ozlabs.org>
 <C232EE9B-92CA-4E7E-BBC7-083D0EBC547B@intel.com>
From: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
Message-ID: <e9892ff8-4c60-6c89-3ec2-b19f6acd54af@linux.intel.com>
Date: Tue, 14 Jan 2020 21:24:16 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <C232EE9B-92CA-4E7E-BBC7-083D0EBC547B@intel.com>
Content-Type: multipart/alternative;
 boundary="------------EF705BD1591A9E412CEA5105"
Content-Language: en-US
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
Cc: "Winiarska, Iwona" <iwona.winiarska@intel.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 rgrs <rgrs@protonmail.com>, "Bhat, Sumanth" <sumanth.bhat@intel.com>,
 Vijay Khemka <vijaykhemka@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------EF705BD1591A9E412CEA5105
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Yes Jeremy. We are aware about the limitation, but as Sharad stated, we 
will be starting with D-Bus based approach, due to priority ( and then 
move to socket based approach, at-least not immediately).

Having said that pushed a WIP document for both MCTP & PLDM (still in 
high level, and low level implementation details capturing are in 
progress). We can further discuss in the review (for better tracking).

1. https://gerrit.openbmc-project.xyz/#/c/openbmc/docs/+/28424/

2. https://gerrit.openbmc-project.xyz/#/c/openbmc/docs/+/28425/

Note: Proposal is to have a abstraction layer between D-Bus & Socket, so 
that upper layers like PLDM can switch to socket-driver based approach 
at later stage.

Related to MCTP over PCIe Iowna will send out a review which will be 
along the MCTP base design document.

Regards,

Richard


On 1/14/2020 12:09 PM, Khetan, Sharad wrote:
> Thanks for the pointer Jeremy. We will look into demux daemon.
> Thanks,
> -Sharad
>
> On Jan 13, 2020, at 10:21 PM, Jeremy Kerr <jk@ozlabs.org 
> <mailto:jk@ozlabs.org>> wrote:
>
>> Hi Ketan,
>>
>> Just a suggestion - you probably don't want to be passing MCTP 
>> messages over dbus - this is something we learnt from the IPMI 
>> implementation.
>>
>> The current design of the mctp-demux-daemon (included in the libmctp 
>> codebase) is intended to provide an interface that will be easy to 
>> migrate to a future kernel implementation (ie., using sockets to pass 
>> MCTP messages), and allows multiple applications to be listening for 
>> MCTP messages of different types.
>>
>> Regards,
>>
>>
>> Jeremy
>>
>> On 14 January 2020 1:54:49 pm AWST, "Khetan, Sharad" 
>> <sharad.khetan@intel.com <mailto:sharad.khetan@intel.com>> wrote:
>>
>>     Hi Deepak,
>>
>>     On 13/01/20 10:23 PM, Khetan, Sharad wrote:
>>
>>         Hi Andrew, On Thu, 9 Jan 2020, at 12:27, Andrew Jeffery wrote:
>>
>>             On Sat, 21 Dec 2019, at 10:45, Khetan, Sharad wrote:
>>
>>                 Hi Andrew, Sorry for late response. The plan is to
>>                 have MCTP in user space. 
>>
>>             How are you handling this then? mmap()'ing the BAR from
>>             sysfs? 
>>
>>             Sorry, let me put my brain back in, I was thinking of the
>>             wrong side of the BMC/Host MCTP channel. How much were
>>             you planning to do in userspace on the BMC? As in, are
>>             you planning to drive the BMC's PCIe MCTP controller from
>>             userspace (presumably via /dev/mem)? 
>>
>>         For implementation on the BMC, we agree that it's better to
>>         do it in kernel (and as you mentioned - use consistent
>>         interface to upper layers, provide another transport).
>>         However, given the time needed to implement things in kernel
>>         (and the review after), we are starting with a short term
>>         solution. We will be implementing MCTP (protocol elements) in
>>         user space, along with a low level MCTP PCIe driver just to
>>         push bits on PCIe. Iwona is working on this and should be
>>         able to describe the exact primitive. 
>>
>>
>>     Do you plan to do the user-space work as an extension to/reusing components from openbmc/libmctp?
>>
>>     Thanks,
>>     Deepak
>>
>>     Yes we plan to reuse and extend the libmctp, support PCIe as well as SMBus bindings. We plan to use d-bus extensions to existing libmctp. That said, we will know the exact extent of reuse/modifications when we really start implementing.
>>
>>     We are implementing this for AST 2600 (will not support any workarounds for AST 2500 bug).
>>
>>     @Andrew, Thanks for your response.
>>
>>     Thanks,
>>     Sharad
>>       
>>

--------------EF705BD1591A9E412CEA5105
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;
      charset=windows-1252">
  </head>
  <body>
    <p>Yes Jeremy. We are aware about the limitation, but as Sharad
      stated, we will be starting with D-Bus based approach, due to
      priority ( and then move to socket based approach, at-least not
      immediately). <br>
    </p>
    <p>Having said that pushed a WIP document for both MCTP &amp; PLDM
      (still in high level, and low level implementation details
      capturing are in progress). We can further discuss in the review
      (for better tracking).<br>
    </p>
    <p>1. <a
        href="https://gerrit.openbmc-project.xyz/#/c/openbmc/docs/+/28424/">https://gerrit.openbmc-project.xyz/#/c/openbmc/docs/+/28424/</a></p>
    <p>2. <a
        href="https://gerrit.openbmc-project.xyz/#/c/openbmc/docs/+/28425/">https://gerrit.openbmc-project.xyz/#/c/openbmc/docs/+/28425/</a></p>
    <p>Note: Proposal is to have a abstraction layer between D-Bus &amp;
      Socket, so that upper layers like PLDM can switch to socket-driver
      based approach at later stage.</p>
    <p>Related to MCTP over PCIe Iowna will send out a review which will
      be along the MCTP base design document.<br>
    </p>
    <p>Regards,</p>
    <p>Richard</p>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 1/14/2020 12:09 PM, Khetan, Sharad
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:C232EE9B-92CA-4E7E-BBC7-083D0EBC547B@intel.com">
      <meta http-equiv="Content-Type" content="text/html;
        charset=windows-1252">
      Thanks for the pointer Jeremy. We will look into demux daemon. <br>
      Thanks,<br>
      <div dir="ltr" id="AppleMailSignature">-Sharad</div>
      <div dir="ltr"><br>
        On Jan 13, 2020, at 10:21 PM, Jeremy Kerr &lt;<a
          href="mailto:jk@ozlabs.org" moz-do-not-send="true">jk@ozlabs.org</a>&gt;
        wrote:<br>
        <br>
      </div>
      <blockquote type="cite">
        <div dir="ltr">Hi Ketan,<br>
          <br>
          Just a suggestion - you probably don't want to be passing MCTP
          messages over dbus - this is something we learnt from the IPMI
          implementation.<br>
          <br>
          The current design of the mctp-demux-daemon (included in the
          libmctp codebase) is intended to provide an interface that
          will be easy to migrate to a future kernel implementation
          (ie., using sockets to pass MCTP messages), and allows
          multiple applications to be listening for MCTP messages of
          different types.<br>
          <br>
          Regards,<br>
          <br>
          <br>
          Jeremy<br>
          <br>
          <div class="gmail_quote">On 14 January 2020 1:54:49 pm AWST,
            "Khetan, Sharad" &lt;<a
              href="mailto:sharad.khetan@intel.com"
              moz-do-not-send="true">sharad.khetan@intel.com</a>&gt;
            wrote:
            <blockquote class="gmail_quote" style="margin: 0pt 0pt 0pt
              0.8ex; border-left: 1px solid rgb(204, 204, 204);
              padding-left: 1ex;">
              <pre class="k9mail">Hi Deepak,

On 13/01/20 10:23 PM, Khetan, Sharad wrote:
<blockquote class="gmail_quote" style="margin: 0pt 0pt 1ex 0.8ex; border-left: 1px solid #729fcf; padding-left: 1ex;">Hi Andrew,

On Thu, 9 Jan 2020, at 12:27, Andrew Jeffery wrote:
<blockquote class="gmail_quote" style="margin: 0pt 0pt 1ex 0.8ex; border-left: 1px solid #ad7fa8; padding-left: 1ex;">

 On Sat, 21 Dec 2019, at 10:45, Khetan, Sharad wrote:
<blockquote class="gmail_quote" style="margin: 0pt 0pt 1ex 0.8ex; border-left: 1px solid #8ae234; padding-left: 1ex;"> Hi Andrew,
 Sorry for late response.
 The plan is to have MCTP in user space.

</blockquote>
 How are you handling this then? mmap()'ing the BAR from sysfs?
</blockquote>
<blockquote class="gmail_quote" style="margin: 0pt 0pt 1ex 0.8ex; border-left: 1px solid #ad7fa8; padding-left: 1ex;">Sorry, let me put my brain back in, I was thinking of the wrong side of the  BMC/Host MCTP channel. How much were you planning to do in userspace on the BMC? As in, are you planning to drive the BMC's PCIe MCTP controller from userspace (presumably via /dev/mem)?
</blockquote>
  
For implementation on the BMC, we agree that it's better to do it in kernel (and as you mentioned  - use consistent interface to upper layers, provide another transport). However, given the time needed to implement things in kernel (and the review after), we are starting with a short term solution. We will be implementing MCTP (protocol elements) in user space, along with a low level MCTP PCIe driver just to push bits on PCIe. Iwona is working on this and should be able to describe the exact primitive.
</blockquote>
Do you plan to do the user-space work as an extension to/reusing components from openbmc/libmctp?

Thanks,
Deepak

Yes we plan to reuse and extend the libmctp, support PCIe as well as SMBus bindings. We plan to use d-bus extensions to existing libmctp. That said, we will know the exact extent of reuse/modifications when we really start implementing.

We are implementing this for AST 2600 (will not support any workarounds for AST 2500 bug). 

@Andrew, Thanks for your response.

Thanks,
Sharad
 
</pre>
            </blockquote>
          </div>
        </div>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------EF705BD1591A9E412CEA5105--
