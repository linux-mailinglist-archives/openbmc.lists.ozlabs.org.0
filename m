Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA0732491
	for <lists+openbmc@lfdr.de>; Sun,  2 Jun 2019 20:28:39 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45H6Br5DN1zDqN5
	for <lists+openbmc@lfdr.de>; Mon,  3 Jun 2019 04:28:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=richard.marian.thomaiyar@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45H6BS6PkZzDqC3
 for <openbmc@lists.ozlabs.org>; Mon,  3 Jun 2019 04:28:16 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Jun 2019 11:28:13 -0700
X-ExtLoop1: 1
Received: from rakesh3x-mobl1.gar.corp.intel.com (HELO [10.252.69.175])
 ([10.252.69.175])
 by orsmga004.jf.intel.com with ESMTP; 02 Jun 2019 11:28:12 -0700
Subject: Re: [IPMI] About LAN interface
To: =?UTF-8?B?U2ltb24gWmh1KOacseiLsea+jSk=?= <zhuysh@inspur.com>,
 Samuel Jiang <chyishian.jiang@gmail.com>
References: <0bf60139f1302379f2ff8355443c0286@sslemail.net>
 <6a7553c7-060b-4318-a710-b903862b47af@Spark>
 <6F24B29F-8F3E-404E-B19D-044C3F017F2A@inspur.com>
From: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
Message-ID: <da4ec1d1-b607-a095-7563-38a1c78d63b9@linux.intel.com>
Date: Sun, 2 Jun 2019 23:58:11 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <6F24B29F-8F3E-404E-B19D-044C3F017F2A@inspur.com>
Content-Type: multipart/alternative;
 boundary="------------1C5E7D1E69ADDCEF884982D4"
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------1C5E7D1E69ADDCEF884982D4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Simon,

We don't support IPMI 1.5 / RMCP session for security reasons. OpenBMC 
IPMI code support only RMCP+ sessions.

Regards,

Richard

On 5/31/2019 1:14 PM, Simon Zhu(朱英澍) wrote:
> Hi Samuel,
>
> I know lanplus interface is ok.
> My question is that can we support both lan and lanplus interface?
>
> Best regards,
> Simon
>
>> 在 2019年5月31日，15:18，Samuel Jiang <chyishian.jiang@gmail.com 
>> <mailto:chyishian.jiang@gmail.com>> 写道：
>>
>> Hi Simon,
>>
>> try use ipmitool -U root  -P 0penBmc -h <host_ip> -I lanplus mc info
>>
>> Reference <https://github.com/openbmc/openbmc/issues/1570>
>>
>> Thanks,
>>
>> Samuel Jiang
>> On May 31, 2019, 8:46 AM +0800, Simon Zhu(朱英澍) <zhuysh@inspur.com 
>> <mailto:zhuysh@inspur.com>>, wrote:
>>> Hello,
>>>
>>> Does IPMI support lan interface?
>>>
>>> I used ipmitool through lan interface, but failed:
>>>
>>> ipmitool -I lan -H IP -U root -P 0penBmc mc info
>>> Authentication type NONE not supported
>>> Error: Unable to establish LAN session
>>> Error: Unable to establish IPMI v1.5 / RMCP session
>>>
>>> Can we support LAN interface?
>>>
>>> Best regards,
>>>
>>> Simon
>

--------------1C5E7D1E69ADDCEF884982D4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Hi Simon,</p>
    <p>We don't support IPMI 1.5 / RMCP session for security reasons.
      OpenBMC IPMI code support only RMCP+ sessions. <br>
    </p>
    <p>Regards,</p>
    <p>Richard<br>
    </p>
    <div class="moz-cite-prefix">On 5/31/2019 1:14 PM, Simon Zhu(朱英澍)
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:6F24B29F-8F3E-404E-B19D-044C3F017F2A@inspur.com">Hi
      Samuel,
      <div class=""><br class="">
      </div>
      <div class=""><span class="Apple-tab-span"> </span>I know lanplus
        interface is ok.</div>
      <div class=""><span class="Apple-tab-span"> </span>My question is
        that can we support both lan and lanplus interface?</div>
      <div class=""><br class="">
      </div>
      <div class="">Best regards,</div>
      <div class="">Simon<br class="">
        <div><br class="">
          <blockquote type="cite" class="">
            <div class="">在 2019年5月31日，15:18，Samuel Jiang &lt;<a
                href="mailto:chyishian.jiang@gmail.com" class=""
                moz-do-not-send="true">chyishian.jiang@gmail.com</a>&gt;
              写道：</div>
            <br class="Apple-interchange-newline">
            <div class="">
              <title class=""></title>
              <div class="">
                <div name="messageBodySection" class="">
                  <div dir="auto" class="">Hi Simon,
                    <div dir="auto" class=""><br class="">
                    </div>
                    <div dir="auto" class="">try use ipmitool -U root
                       -P 0penBmc -h &lt;host_ip&gt; -I lanplus mc info</div>
                    <div dir="auto" class=""><br class="">
                    </div>
                    <div dir="auto" class=""><a
                        href="https://github.com/openbmc/openbmc/issues/1570"
                        class="" moz-do-not-send="true">Reference</a></div>
                  </div>
                </div>
                <div name="messageSignatureSection" class=""><br
                    class="">
                  <div class="matchFont">Thanks,
                    <div class=""><br class="">
                    </div>
                    <div class="">Samuel Jiang</div>
                  </div>
                </div>
                <div name="messageReplySection" class="">On May 31,
                  2019, 8:46 AM +0800, Simon Zhu(朱英澍) &lt;<a
                    href="mailto:zhuysh@inspur.com" class=""
                    moz-do-not-send="true">zhuysh@inspur.com</a>&gt;,
                  wrote:<br class="">
                  <blockquote type="cite" class="spark_quote">Hello,<br
                      class="">
                    <br class="">
                    Does IPMI support lan interface?<br class="">
                    <br class="">
                    I used ipmitool through lan interface, but failed:<br
                      class="">
                    <br class="">
                    ipmitool -I lan -H IP -U root -P 0penBmc mc info<br
                      class="">
                    Authentication type NONE not supported<br class="">
                    Error: Unable to establish LAN session<br class="">
                    Error: Unable to establish IPMI v1.5 / RMCP session<br
                      class="">
                    <br class="">
                    Can we support LAN interface?<br class="">
                    <br class="">
                    Best regards,<br class="">
                    <br class="">
                    Simon</blockquote>
                </div>
              </div>
            </div>
          </blockquote>
        </div>
        <br class="">
      </div>
    </blockquote>
  </body>
</html>

--------------1C5E7D1E69ADDCEF884982D4--
