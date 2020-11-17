Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F502B68CC
	for <lists+openbmc@lfdr.de>; Tue, 17 Nov 2020 16:35:03 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cb9442D1WzDqVR
	for <lists+openbmc@lfdr.de>; Wed, 18 Nov 2020 02:35:00 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=jozef.wludzik@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cb9393mnVzDq7F
 for <openbmc@lists.ozlabs.org>; Wed, 18 Nov 2020 02:34:12 +1100 (AEDT)
IronPort-SDR: BFSPq6MgAjY2LRwUUYAmHhCxY6bD6sbGKk/jreAZN98t/+hCYnn4cHV1oofXt+U0cr6LwKFkI1
 3sD9EtR2XOeQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9808"; a="171114451"
X-IronPort-AV: E=Sophos;i="5.77,485,1596524400"; 
 d="scan'208,217";a="171114451"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2020 07:34:08 -0800
IronPort-SDR: BURlkjyWgK90qwHqGGEb+aZOpWr9w11/KUZknQPbS0TlI612iHPL81tG4abJ81+pKyEX0GweXO
 5kJnzo+Ry0eA==
X-IronPort-AV: E=Sophos;i="5.77,485,1596524400"; 
 d="scan'208,217";a="544085840"
Received: from jwludzik-mobl.ger.corp.intel.com (HELO [10.213.1.209])
 ([10.213.1.209])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2020 07:34:07 -0800
Subject: Re: Add peci-pcie repo to CI
From: "Wludzik, Jozef" <jozef.wludzik@linux.intel.com>
To: openbmc@lists.ozlabs.org, Andrew Geissler <geissonator@gmail.com>,
 ed@tanous.net
References: <7d749dad-e4c0-0243-d701-4a6448fe3433@linux.intel.com>
 <eef808e1-34e1-096e-a335-5b6ebbff9964@linux.intel.com>
 <033645AC-B5C4-4FE9-A1DC-BE2030431613@gmail.com>
 <CACWQX815h68gp-BFFMg+5aM-hM8WgyzFYo94cOXo7SXfqDWpuw@mail.gmail.com>
 <5024f9ba-ef40-954f-1578-a9353532ff90@linux.intel.com>
Message-ID: <3ebe47bd-478a-5578-0a70-ce6bca743571@linux.intel.com>
Date: Tue, 17 Nov 2020 16:34:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <5024f9ba-ef40-954f-1578-a9353532ff90@linux.intel.com>
Content-Type: multipart/alternative;
 boundary="------------0770D7CDC268181DB7E69999"
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
--------------0770D7CDC268181DB7E69999
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Ok, now everything builds after bumping boost.

I wonder how to read error log from test failure, for example from here
https://jenkins.openbmc.org/job/ci-repository/7973/consoleFull 
<https://jenkins.openbmc.org/job/ci-repository/7973/consoleFull>

[29/29] Linking target tests/telemetry-ut
*1/1 telemetry-ut FAIL 6.28s (exit status 1)*

Ok:                 0
Expected Fail:      0
Fail:               1
Unexpected Pass:    0
Skipped:            0
Timeout:            0

Full log written to /home/jenkins-slave/workspace/ci-repository/openbmc/telemetry/build/meson-logs/testlog-ubasan.txt


If testlog-ubasan.txt is not stored anywhere, I am going to add 
--print-errorlogs to unit_test.py 
(https://github.com/openbmc/openbmc-build-scripts/blob/master/scripts/unit-test.py#L888 
<https://github.com/openbmc/openbmc-build-scripts/blob/master/scripts/unit-test.py#L888>) 
. Hope you are ok with it

Thanks,
Jozef

On 11/17/2020 12:19 PM, Wludzik, Jozef wrote:
> Sorry for subject, I forgot to change it. It should be "Add telemetry 
> report to CI jobs". Mail is not related to peci-pcie.
> Great, thanks for help with enabling it. I decreased meson version to 
> 0.54.3, it is ok for telemetry project. Telemetry required to bump 
> boost to 1.74.0 in container to use CI in the latest patches ->
>
> https://gerrit.openbmc-project.xyz/c/openbmc/openbmc-build-scripts/+/38323 
>
>
> Regards,
> Jozef
>
> On 11/16/2020 17:36 PM, Ed Tanous wrote:
>> On Mon, Nov 16, 2020 at 8:20 AM Andrew Geissler 
>> <geissonator@gmail.com> wrote:
>>>
>>>
>>>> On Nov 16, 2020, at 9:32 AM, Wludzik, Jozef 
>>>> <jozef.wludzik@linux.intel.com> wrote:
>>>>
>>>> Hi OpenBMC,
>>>> I am looking for guidance or advice how to enable CI jobs for 
>>>> telemetry repository (https://github.com/openbmc/telemetry 
>>>> <https://github.com/openbmc/telemetry>). Thanks in advance for 
>>>> response.
>>>>
>>> I added the repo to our CI. I do see this error though:
>>>
>>> meson.build:1:0: ERROR: Meson version is 0.54.3 but project requires 
>>> >=0.55.0
>> FYI, That package won't build and work until PECI is added back to the
>> linux tree.  See discussion below for details as to why, and what you
>> can do to help upstream it.
>>
>> https://lore.kernel.org/openbmc/CACPK8XddFvszC1daDKTtqwkE-XDfB7uYFP_H4HZXNUxvNHUaqw@mail.gmail.com/ 
>>
>>
>>> If you need that level of meson then please submit a gerrit commit 
>>> to openbmc-build-scripts
>>> to update what CI uses:
>>> https://github.com/openbmc/openbmc-build-scripts/blob/master/build-unit-test-docker.sh#L284 
>>>
>>>
>>>> Thanks,
>>>> Jozef
>>>>

--------------0770D7CDC268181DB7E69999
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Ok, now everything builds after bumping boost.</p>
    <p>I wonder how to read error log from test failure, for example
      from here<br>
      <a moz-do-not-send="true"
        href="https://jenkins.openbmc.org/job/ci-repository/7973/consoleFull">https://jenkins.openbmc.org/job/ci-repository/7973/consoleFull</a></p>
    <pre>[29/29] Linking target tests/telemetry-ut
<b style="box-sizing: inherit;"><span style="box-sizing: inherit; color: rgb(205, 0, 0);">1/1 telemetry-ut FAIL           6.28s (exit status 1)</span></b>

Ok:                 0   
Expected Fail:      0   
Fail:               1   
Unexpected Pass:    0   
Skipped:            0   
Timeout:            0   

Full log written to /home/jenkins-slave/workspace/ci-repository/openbmc/telemetry/build/meson-logs/testlog-ubasan.txt</pre>
    <p><br>
    </p>
    <p>If testlog-ubasan.txt is not stored anywhere, I am going to add <span
        style="color: rgb(36, 41, 46); font-family: SFMono-Regular,
        Consolas, &quot;Liberation Mono&quot;, Menlo, monospace;
        font-size: 11.9px; font-style: normal; font-variant-ligatures:
        normal; font-variant-caps: normal; font-weight: 400;
        letter-spacing: normal; orphans: 2; text-align: start;
        text-indent: 0px; text-transform: none; white-space: normal;
        widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;
        background-color: rgba(27, 31, 35, 0.05); text-decoration-style:
        initial; text-decoration-color: initial; display: inline
        !important; float: none;"><span></span>--print-errorlogs</span>
      to unit_test.py (<a moz-do-not-send="true"
href="https://github.com/openbmc/openbmc-build-scripts/blob/master/scripts/unit-test.py#L888">https://github.com/openbmc/openbmc-build-scripts/blob/master/scripts/unit-test.py#L888</a>)
      . Hope you are ok with it<span style="color: rgb(36, 41, 46);
        font-family: SFMono-Regular, Consolas, &quot;Liberation
        Mono&quot;, Menlo, monospace; font-size: 11.9px; font-style:
        normal; font-variant-ligatures: normal; font-variant-caps:
        normal; font-weight: 400; letter-spacing: normal; orphans: 2;
        text-align: start; text-indent: 0px; text-transform: none;
        white-space: normal; widows: 2; word-spacing: 0px;
        -webkit-text-stroke-width: 0px; background-color: rgba(27, 31,
        35, 0.05); text-decoration-style: initial;
        text-decoration-color: initial; display: inline !important;
        float: none;"><br>
      </span></p>
    <p>Thanks,<br>
      Jozef <span style="color: rgb(36, 41, 46); font-family:
        SFMono-Regular, Consolas, &quot;Liberation Mono&quot;, Menlo,
        monospace; font-size: 11.9px; font-style: normal;
        font-variant-ligatures: normal; font-variant-caps: normal;
        font-weight: 400; letter-spacing: normal; orphans: 2;
        text-align: start; text-indent: 0px; text-transform: none;
        white-space: normal; widows: 2; word-spacing: 0px;
        -webkit-text-stroke-width: 0px; background-color: rgba(27, 31,
        35, 0.05); text-decoration-style: initial;
        text-decoration-color: initial; display: inline !important;
        float: none;"></span></p>
    <div class="moz-cite-prefix">On 11/17/2020 12:19 PM, Wludzik, Jozef
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:5024f9ba-ef40-954f-1578-a9353532ff90@linux.intel.com">Sorry
      for subject, I forgot to change it. It should be "Add telemetry
      report to CI jobs". Mail is not related to peci-pcie.
      <br>
      Great, thanks for help with enabling it. I decreased meson version
      to 0.54.3, it is ok for telemetry project. Telemetry required to
      bump boost to 1.74.0 in container to use CI in the latest patches
      -&gt;
      <br>
      <br>
<a class="moz-txt-link-freetext" href="https://gerrit.openbmc-project.xyz/c/openbmc/openbmc-build-scripts/+/38323">https://gerrit.openbmc-project.xyz/c/openbmc/openbmc-build-scripts/+/38323</a>
      <br>
      <br>
      Regards,
      <br>
      Jozef
      <br>
      <br>
      On 11/16/2020 17:36 PM, Ed Tanous wrote:
      <br>
      <blockquote type="cite">On Mon, Nov 16, 2020 at 8:20 AM Andrew
        Geissler <a class="moz-txt-link-rfc2396E" href="mailto:geissonator@gmail.com">&lt;geissonator@gmail.com&gt;</a> wrote:
        <br>
        <blockquote type="cite">
          <br>
          <br>
          <blockquote type="cite">On Nov 16, 2020, at 9:32 AM, Wludzik,
            Jozef <a class="moz-txt-link-rfc2396E" href="mailto:jozef.wludzik@linux.intel.com">&lt;jozef.wludzik@linux.intel.com&gt;</a> wrote:
            <br>
            <br>
            Hi OpenBMC,
            <br>
            I am looking for guidance or advice how to enable CI jobs
            for telemetry repository
            (<a class="moz-txt-link-freetext" href="https://github.com/openbmc/telemetry">https://github.com/openbmc/telemetry</a>
            <a class="moz-txt-link-rfc2396E" href="https://github.com/openbmc/telemetry">&lt;https://github.com/openbmc/telemetry&gt;</a>). Thanks in
            advance for response.
            <br>
            <br>
          </blockquote>
          I added the repo to our CI. I do see this error though:
          <br>
          <br>
          meson.build:1:0: ERROR: Meson version is 0.54.3 but project
          requires &gt;=0.55.0
          <br>
        </blockquote>
        FYI, That package won't build and work until PECI is added back
        to the
        <br>
        linux tree.  See discussion below for details as to why, and
        what you
        <br>
        can do to help upstream it.
        <br>
        <br>
<a class="moz-txt-link-freetext" href="https://lore.kernel.org/openbmc/CACPK8XddFvszC1daDKTtqwkE-XDfB7uYFP_H4HZXNUxvNHUaqw@mail.gmail.com/">https://lore.kernel.org/openbmc/CACPK8XddFvszC1daDKTtqwkE-XDfB7uYFP_H4HZXNUxvNHUaqw@mail.gmail.com/</a>
        <br>
        <br>
        <blockquote type="cite">If you need that level of meson then
          please submit a gerrit commit to openbmc-build-scripts
          <br>
          to update what CI uses:
          <br>
<a class="moz-txt-link-freetext" href="https://github.com/openbmc/openbmc-build-scripts/blob/master/build-unit-test-docker.sh#L284">https://github.com/openbmc/openbmc-build-scripts/blob/master/build-unit-test-docker.sh#L284</a>
          <br>
          <br>
          <blockquote type="cite">Thanks,
            <br>
            Jozef
            <br>
            <br>
          </blockquote>
        </blockquote>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------0770D7CDC268181DB7E69999--
