Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD5536D4ED
	for <lists+openbmc@lfdr.de>; Wed, 28 Apr 2021 11:44:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FVYcW47TZz302H
	for <lists+openbmc@lfdr.de>; Wed, 28 Apr 2021 19:44:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mga12.intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=krzysztof.grobelny@linux.intel.com; receiver=<UNKNOWN>)
X-Greylist: delayed 64 seconds by postgrey-1.36 at boromir;
 Wed, 28 Apr 2021 19:44:00 AEST
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FVYcJ0NnLz2y81
 for <openbmc@lists.ozlabs.org>; Wed, 28 Apr 2021 19:43:59 +1000 (AEST)
IronPort-SDR: EDM+NIQfEp62D6ktCzTac0x1N9hByishpJNJ8KV/L4n5fihppwNMPZ+i9UuykejTxTcdgNNib/
 6qPos9t3y1Qw==
X-IronPort-AV: E=McAfee;i="6200,9189,9967"; a="176181567"
X-IronPort-AV: E=Sophos;i="5.82,257,1613462400"; 
 d="scan'208,217";a="176181567"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2021 02:42:46 -0700
IronPort-SDR: y+WFWE9hpxeUkHW+cAlyhdZCsfY2PuXQOArKWK8kak9OmaGzFTDp1JTt1KahkH1KzswPOvZI2G
 JMy6h+K+0l4g==
X-IronPort-AV: E=Sophos;i="5.82,257,1613462400"; 
 d="scan'208,217";a="536898538"
Received: from kgrobeln-mobl.ger.corp.intel.com (HELO [10.213.25.136])
 ([10.213.25.136])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2021 02:42:46 -0700
Subject: Re: any in-progress Redfish TelemetryService enhancements?
To: openbmc@lists.ozlabs.org
References: <20210218190654.kkdsmrlxgenzr6nz@thinkpad.fuzziesquirrel.com>
 <CACWQX81HtHCqXZCzmJqppR+tBy5xDjBHa_q5gw7YTHZ9UaAH2w@mail.gmail.com>
 <20210219193348.n5e6w4e2vr4sk5ge@thinkpad.fuzziesquirrel.com>
 <47d61387-d71f-b72a-fe30-316a3a37829b@linux.intel.com>
 <20210301150552.hfwsnzgb5wczdpyx@thinkpad.fuzziesquirrel.com>
 <CANFuQ7CaZW6mY11MjYQjk7heq00UuAFgS37JiFBw0WFBCGQNtw@mail.gmail.com>
 <CACWQX80ZKiXJGH58L_1HVGie=CB0+3XD8RJq6sAZhdTq6UadtA@mail.gmail.com>
 <20210310135248.wvy7xwwjhjxe4hlh@thinkpad.fuzziesquirrel.com>
 <CACWQX83sHwbW435Ph9+e2xyPmqxNyih5L=Rs96ydR0mZQOLzpg@mail.gmail.com>
 <20210310154740.qj6wbvqym4utypbv@thinkpad.fuzziesquirrel.com>
 <CANFuQ7BXjb409o=jP+aQVVLKfzJdQOYBLThZgR7Eeym1pXy21w@mail.gmail.com>
From: "Grobelny, Krzysztof" <krzysztof.grobelny@linux.intel.com>
Message-ID: <99261c99-a049-b5df-45f5-75690da9159c@linux.intel.com>
Date: Wed, 28 Apr 2021 11:41:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <CANFuQ7BXjb409o=jP+aQVVLKfzJdQOYBLThZgR7Eeym1pXy21w@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------108CE333A31EB839E1C3401E"
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------108CE333A31EB839E1C3401E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

Our current plan looks like this:

Completing outgoing review in bmcweb for telemetry:
https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/33363 
<https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/33363>
https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/38798/27 
<https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/38798/27>
https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/41813/1 
<https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/41813/1>

With start of July will finish work on features already started and fix 
know issues, then we will start working on "Append".
By currently ongoing feature I mean Triggers and Aggregation functions, 
review below doesn't cover everything we need to implement:
https://gerrit.openbmc-project.xyz/c/openbmc/telemetry/+/41064 
<https://gerrit.openbmc-project.xyz/c/openbmc/telemetry/+/41064>, 
https://gerrit.openbmc-project.xyz/c/openbmc/telemetry/+/40941 
<https://gerrit.openbmc-project.xyz/c/openbmc/telemetry/+/40941>, 
https://gerrit.openbmc-project.xyz/c/openbmc/telemetry/+/41678 
<https://gerrit.openbmc-project.xyz/c/openbmc/telemetry/+/41678>

My estimate is that we will deliver "Append" in Q4 2021.

Best regards,
Krzysztof Grobelny

On 2021-04-28 04:15, George Liu wrote:
> Hi All:
> Around Telemetry(Support AppendWrapsWhenFull):
> I added a new interface and merged:
> https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-dbus-interfaces/+/41010
>
> So, @Wludzik, Wonder if there is a plan to implement it?
> If Yes, Could you share the time cut-off point?
>
> Thanks again.
>
> George Liu
>
> On Wed, Mar 10, 2021 at 11:47 PM Brad Bishop
> <bradleyb@fuzziesquirrel.com> wrote:
>> On Wed, Mar 10, 2021 at 07:12:39AM -0800, Ed Tanous wrote:
>>
>>> It would be really helpful if you could add your input and participate
>>> in the reviews.  In this specific case, I recall pointing out the
>>> missing Min/Max/Average aggregations (from the first bug) in one of
>>> the original telemetry code reviews.  I don't remember what the answer
>>> was there, but I don't think it got added.  I don't think append
>>> behavior has come up, but I suspect it would've changed some of the
>>> initial design if we had known it was desired.
>> FWIW this interest in the telemetry work has only emerged very recently
>> (around when I sent the first mail in this thread).
>>
>> -brad

--------------108CE333A31EB839E1C3401E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div style="box-sizing: border-box; font-family: &quot;Segoe
      UI&quot;, system-ui, &quot;Apple Color Emoji&quot;, &quot;Segoe UI
      Emoji&quot;, sans-serif; font-size: 14px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px;">
      <div>Hello,<br>
        <br>
        Our current plan looks like this:</div>
      <div><br>
      </div>
      <div> </div>
      <div>Completing outgoing review in bmcweb for telemetry:</div>
      <div class="copy-paste-block"><a
          href="https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/33363"
          rel="noreferrer noopener" target="_blank"
          title="https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/33363"
          tabindex="-1">https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/33363</a></div>
      <div class="copy-paste-block"><a
          href="https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/38798/27"
          rel="noreferrer noopener" target="_blank"
          title="https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/38798/27"
          tabindex="-1">https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/38798/27</a></div>
      <div class="copy-paste-block"><a
          href="https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/41813/1"
          rel="noreferrer noopener" target="_blank"
          title="https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/41813/1"
          tabindex="-1">https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/41813/1</a></div>
      <div class="copy-paste-block"><br>
      </div>
      <div> </div>
      <div>With start of July <span style="font-size:10.5pt;"><span><span>will
              finish work on features already started and fix know
              issues, then we will start working on "Append".</span></span></span></div>
      <div> </div>
      <div>By currently ongoing feature I mean Triggers and Aggregation
        functions, review below doesn't cover everything we need to
        implement:</div>
      <div><a
          href="https://gerrit.openbmc-project.xyz/c/openbmc/telemetry/+/41064"
          rel="noreferrer noopener" target="_blank"
          title="https://gerrit.openbmc-project.xyz/c/openbmc/telemetry/+/41064"
          tabindex="-1">https://gerrit.openbmc-project.xyz/c/openbmc/telemetry/+/41064</a>,
        <a
          href="https://gerrit.openbmc-project.xyz/c/openbmc/telemetry/+/40941"
          rel="noreferrer noopener" target="_blank"
          title="https://gerrit.openbmc-project.xyz/c/openbmc/telemetry/+/40941"
          tabindex="-1">https://gerrit.openbmc-project.xyz/c/openbmc/telemetry/+/40941</a>,
        <a
          href="https://gerrit.openbmc-project.xyz/c/openbmc/telemetry/+/41678"
          rel="noreferrer noopener" target="_blank"
          title="https://gerrit.openbmc-project.xyz/c/openbmc/telemetry/+/41678"
          tabindex="-1">https://gerrit.openbmc-project.xyz/c/openbmc/telemetry/+/41678</a></div>
      <div><br>
      </div>
      <div> </div>
      <div>My estimate is that we will deliver "Append" in Q4 2021.<br>
        <br>
        Best regards,<br>
        Krzysztof Grobelny<br>
        <br>
      </div>
    </div>
    <div class="moz-cite-prefix">On 2021-04-28 04:15, George Liu wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CANFuQ7BXjb409o=jP+aQVVLKfzJdQOYBLThZgR7Eeym1pXy21w@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">Hi All:
Around Telemetry(Support AppendWrapsWhenFull):
I added a new interface and merged:
<a class="moz-txt-link-freetext" href="https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-dbus-interfaces/+/41010">https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-dbus-interfaces/+/41010</a>

So, @Wludzik, Wonder if there is a plan to implement it?
If Yes, Could you share the time cut-off point?

Thanks again.

George Liu

On Wed, Mar 10, 2021 at 11:47 PM Brad Bishop
<a class="moz-txt-link-rfc2396E" href="mailto:bradleyb@fuzziesquirrel.com">&lt;bradleyb@fuzziesquirrel.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
On Wed, Mar 10, 2021 at 07:12:39AM -0800, Ed Tanous wrote:

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">It would be really helpful if you could add your input and participate
in the reviews.  In this specific case, I recall pointing out the
missing Min/Max/Average aggregations (from the first bug) in one of
the original telemetry code reviews.  I don't remember what the answer
was there, but I don't think it got added.  I don't think append
behavior has come up, but I suspect it would've changed some of the
initial design if we had known it was desired.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
FWIW this interest in the telemetry work has only emerged very recently
(around when I sent the first mail in this thread).

-brad
</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------108CE333A31EB839E1C3401E--
