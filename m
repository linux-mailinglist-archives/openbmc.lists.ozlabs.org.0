Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6640C466E8
	for <lists+openbmc@lfdr.de>; Fri, 14 Jun 2019 20:02:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45QT3Z4RxVzDrhK
	for <lists+openbmc@lfdr.de>; Sat, 15 Jun 2019 04:02:50 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45QT2w1yRtzDrf7
 for <openbmc@lists.ozlabs.org>; Sat, 15 Jun 2019 04:02:09 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Jun 2019 11:00:48 -0700
X-ExtLoop1: 1
Received: from hades.jf.intel.com (HELO [10.54.51.78]) ([10.54.51.78])
 by orsmga001.jf.intel.com with ESMTP; 14 Jun 2019 11:00:48 -0700
Subject: Re: Proposal to replace Clang Format with ESLint and Prettier in
 phosphor-webui
To: Derick <derick.montague@gmail.com>
References: <CAOUmYFRfVQha0NCZd2aLTc-EC2GNF8wuXqnAyWNMCpzcecQUKw@mail.gmail.com>
 <6f963ba0-467f-14fe-ac0b-7c09b547d109@intel.com>
 <CAOUmYFRHh3bQSwmFMEcvokd6_yFxPE7-X+UmBTcFxMegHdX0eA@mail.gmail.com>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <26aeae20-6815-d160-584f-c9252ec6a568@intel.com>
Date: Fri, 14 Jun 2019 11:00:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAOUmYFRHh3bQSwmFMEcvokd6_yFxPE7-X+UmBTcFxMegHdX0eA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 6/14/19 10:12 AM, Derick wrote:
> 
> I am ok if we don't want to use Prettier for JavaScript, but
> clang-format does not

Never really thought of that, and that's a fair criticism of using
clang-format for the web stuff.  I do have prettier hooked into my
editor for the scss files, so I guess I never really thought about it.

> support SCSS and we would like to have consistent formatting in SCSS as well.
> We wouldn't expect it to stop the builds, just to ensure code quality. I want
> to use the .prettierrc file to keep it consistent for anyone that uses
> Prettier and
> we can easily ignore .js files in the config. We can also make this a
> work in progress
> if we don't want to try and resolve all the files up front.
> 
>> If ESlint is really something you want to tackle, by all means, but in
>> terms of value to the end user, I suspect it's a wash.
> 
> I feel the benefit to the user is code quality and to the developer it
> is efficiency.
> You're correct, the formatting is not something that results in bugs that
> require rework. However, clang-format does not surface any potential errors.
> It is simply a formatting tool and not one that is widely used in the JavaScript
> community (https://www.npmtrends.com/clang-format-vs-eslint-vs-prettier).
> ESLint is extremely helpful to people using IDE/Editors like Visual Studio
> Code due to it's integration and showing the developer potential problems
> in their code as they are writing it. Personally, I have found the
> formatting of
> ESLint with the Google shared config preferable than clang-format and more
> consistent with the formatting most JavaScript projects use.

Maybe this is some of the disconnect.  When I went through this
exercise, the only thing it was doing was bumping some braces around to
different locations, which is already consistent across the project.  I
didn't really see a significant impact.  If you think the google config
makes you more efficient, by all means, I can get behind it, that just
wasn't my experience.

> 
>> If you start with eslint-config-google, the changes are a lot less
>> invasive, as we're pretty close to being compliant.
> 
> We want to use ESLint based on its ability to catch errors. I did
> start with Google's
> shared eslint configuration file and it is less invasive. There are
> still a few issues to
> resolve with that configuration, but if that is the tradeoff for using
> ESLint, I'm good with that.

This is kind of what I'm talking about.  I had the same hope, but I
didn't really see a lot of errors being caught that would've been a real
production issue.  With that said, it looks like you turned on a heck of
a lot more checks than I did.  Did you find any patterns that the UI
consistently got wrong?  Were there checks that identified real
functional issues in the webui (memory leaks, bad pages, race
conditions, ect)

I'm scrolling through your changeset, and most of it seems like
whitespace.  The brace rules are different.  Object keys seem like
they're always quoted.  CSS pixel alignments take the form of "0.6em"
versus ".6em".  Not a lot of these improve the readability a lot IMO.

> 
>> At one point I had looked at moving forward with Angular 2 and
>> typescript, and tried to sketch out the path to get there, but it
>> quickly got out of hand.
> 
> Agree, that will require effort and time and our team doesn't have the
> bandwidth for that.
> 
Yep.  I wasn't asking your team to do it.  I was more pointing out that
a lot of the stuff that I was really wanting out of this exercise:
(static analysis, transpiration correctness guarantees, type safety,
increased code review efficiency with automation), were only available
or useful when used from a typescript application.


All in all, if this is something you want, I can get behind it.
