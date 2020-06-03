Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 289B31EC611
	for <lists+openbmc@lfdr.de>; Wed,  3 Jun 2020 02:07:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49c8PB2RLRzDqYS
	for <lists+openbmc@lfdr.de>; Wed,  3 Jun 2020 10:07:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49c8NV5X1nzDqXl
 for <openbmc@lists.ozlabs.org>; Wed,  3 Jun 2020 10:07:06 +1000 (AEST)
IronPort-SDR: dZuE7Le+6VDyq5p8Ni9Ali51I5k105LehEQlT7MhMPbCFRssi4MWhBvIb4KoJrDCqr9s/CWX7E
 gaMw+i7hLE4g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2020 17:07:03 -0700
IronPort-SDR: 9FiX0263/9LO0KOtMr6NUF2x4hYTSgbRUK1G5Y3z/85Pb94IzcX/OMhbEu9lhW6gF645MrmnEs
 PLO/rFgG4a0Q==
X-IronPort-AV: E=Sophos;i="5.73,466,1583222400"; d="scan'208";a="272544688"
Received: from vmauery-desk.jf.intel.com (HELO mauery.jf.intel.com)
 ([10.7.150.62])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2020 17:07:03 -0700
Date: Tue, 2 Jun 2020 17:07:02 -0700
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Patrick Williams <patrick@stwcx.xyz>
Subject: Re: OpenBMC Logging and Error Handling Dos and Don'ts
Message-ID: <20200603000702.GC7478@mauery.jf.intel.com>
References: <4c4aa12b1ffde80ebbf49ad78b6046889f4226c0.camel@fuzziesquirrel.com>
 <CAGm54UGorGfE-0FKj_+o3faU6sO-DW5jRoqPxFzx0VKwuD6Juw@mail.gmail.com>
 <CAPnigKku77Tc60TAAb_yTJaWNePYWM204BF8erJS7CjhxrAPRA@mail.gmail.com>
 <20200602230639.GK17541@heinlein>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200602230639.GK17541@heinlein>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: openbmc <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>,
 =?utf-8?B?6YOB6Zu3?= <yulei.sh@bytedance.com>,
 William Kennington <wak@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 02-Jun-2020 06:06 PM, Patrick Williams wrote:
>On Mon, Jun 01, 2020 at 11:07:46PM -0700, William Kennington wrote:
>> If you use the fmt library it would only require one extra temporary str=
ing
>> to be constructed and it works trivially with something like phosphor
>> logging.
>>
>> log<level::INFO>(fmt::format("My error: {}", filename));
>>
>> It also has the advantage of understanding basic c++ types like
>> std::strings and std::string_views.
>>
>> On Mon, Jun 1, 2020 at 8:33 PM =E9=83=81=E9=9B=B7 <yulei.sh@bytedance.co=
m> wrote:
>>
>> > I have a bit concern about this. The existing phosphor-logging API
>> > does not support this well.
>> > Specifically, it does not support the "printf" way to generate a
>> > string with the variables to log.
>> > So previously we typically put the variables in entries.
>> > I do agree that logging the variables in the MESSAGE field is much bet=
ter.
>> > But to encourage such logging, the logging API should be enhanced to
>> > support the "printf" way.
>> > E.g.
>> >     log<level::INFO>("Something is wrong: %s:%d", xx, xxx);
>> > is much better than:
>> >     std::string to_log =3D xxx; // generate the message manually
>> >     log<level::INFO>(to_log);
>> >
>> > Otherwise, it's really not convenient to write such logging code.
>> >
>
>Separate from this proposal from Brad, I'd like to work on a
>next-generation of phosphor-logging.  When we originally implemented
>phosphor-logging we were all pretty new to C++14.  I think there can be
>some great improvement in the syntax of phosphor-logging now that we
>have C++17 (and more experience).
>
>The biggest change I'd like to do is in the way the structured entries
>are defined, but I think we can improve the verbosity of syntax in
>making a log in general.

One more change I would like to see is a way to actually have the real=20
filename and line number show up in the systemd log. Right now the=20
filename and line number are always the logger code:
    CODE_LINE=3D76
    CODE_FUNC=3Dhelper_log
    CODE_FILE=3D.../usr/include/phosphor-logging/log.hpp

It looks like C++20 has a shiny new helper for this: source_location
https://en.cppreference.com/w/cpp/experimental/source_location

--Vernon

>Some example syntax:
>
>// Current syntax (and I'm being especially verbose on the namespaces).
>phosphor::logging::log<phosphor::logging::level::ERR>("Some message",
>    phosphor::logging::entry("EXAMPLE=3D%s"), example_str);
>
>// Potential syntax
>lg::error("Some message", "EXAMPLE"_s, example_str);
>
>In a code-review I was on, we had some discussions about how difficult
>it is to create data that isn't in the "-o verbose" and I think William
>and Lei are both referring to that as well.  I am concerned that a
>generic format leads us more to unstructured logging, which personally I
>don't like.  My suggestion is that we have some easy syntax to indicate
>"also put this structured data into the raw message" so that my example
>above the message becomes "Some message. EXAMPLE=3D'the string'".
>
>I'd be interested to hear what "next generation logging" others have in
>mind.
>
>--=20
>Patrick Williams


