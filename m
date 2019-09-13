Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE0CB2663
	for <lists+openbmc@lfdr.de>; Fri, 13 Sep 2019 22:03:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46VRQC2fF9zF5qC
	for <lists+openbmc@lfdr.de>; Sat, 14 Sep 2019 06:02:59 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::843; helo=mail-qt1-x843.google.com;
 envelope-from=emilyshaffer@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="QsAY6sBz"; 
 dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46VRPW5MlkzF5nh
 for <openbmc@lists.ozlabs.org>; Sat, 14 Sep 2019 06:02:22 +1000 (AEST)
Received: by mail-qt1-x843.google.com with SMTP id r5so35393701qtd.0
 for <openbmc@lists.ozlabs.org>; Fri, 13 Sep 2019 13:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Rs4GzRn2z1h9THgsOhZnChPCLLzWZgkhiacbytr//nI=;
 b=QsAY6sBz/1rUh8/roz7kLvYbI/EVIp6RVYKfZ+yddmLAC13P+w1N1kGwabqlu3rVeo
 Khlxe6e7FOi8pdIg8TgWICKv8EAYo/Yf2d0ddXkZBrD2gQ0Xu1heKIm5jNukez8EZsQL
 ZOgP8TMBfrQxLsM755QRahuq1LNV9EGFxZdZmRwUmO7BVbev2SagUO2bzRooQuEmgu4i
 U4w1x9MaYqos42kZhEN9cuO1zMTHRhgdnYTyFAKVG6aTf7rbHnH2eKccO0U/fP6GFKmG
 PXo8RJFdrv5Cna7rWXEynZ45YS91ElLRx9mXEzOnF06n5c8EWgTKr5YOLsa5LWV+hqzZ
 50Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Rs4GzRn2z1h9THgsOhZnChPCLLzWZgkhiacbytr//nI=;
 b=JIB1PNeSVUPzsPyhEsrnQ1Mnh1syYMO/5hGg8tJ6bMUYqPpVNivTDsrEEdKujfT5BS
 01WP5eDnu3kzl+tjt3pCO4KEpJ/5YInasYBs+F0pWPph6X1gz10NQx+vedXDiQ6mq+Bk
 rjORZFfQISEeBHM8cE169yqriWmzewMewblrrg7Q9Q/1MkB/1un4LjQ9iJ3CAzo6IUPu
 gl7fYqsKXUnNI9TAhgHhj6tdArlUvy0PMQTfJyOvCP5WWkxm/84mZjLuCNKod9gCtssu
 c0B3aWRxhOBACwpnmESWYJhk/Wu43zuzSnVx1fsxVBwnezqhdlD4QaHK2zAQ6FRGWhrR
 uBgw==
X-Gm-Message-State: APjAAAXjua6PmbCNaFdLR7PyyUxZcSjkUND1vQrmNx+lTcOAaExmU248
 p5v+7FkdIWBlR1MjPUKuSUz4Ty7Z2/dPc8sn8/SCsg==
X-Google-Smtp-Source: APXvYqwglcVB1VzHY3NdaFjwxd/CoXmfC5aKx1/MLIKOGTpif0sAwSdlXoOwSYV+AzNl0tNpC68WSIIo0yGtVNNdJyM=
X-Received: by 2002:ac8:2bca:: with SMTP id n10mr5166233qtn.242.1568404938840; 
 Fri, 13 Sep 2019 13:02:18 -0700 (PDT)
MIME-Version: 1.0
References: <EB0500AF-9574-4007-BE55-B6E7384D027C@fb.com>
 <f5205bbe-7320-67ee-2b2d-91c5cc185b02@intel.com>
In-Reply-To: <f5205bbe-7320-67ee-2b2d-91c5cc185b02@intel.com>
From: Emily Shaffer <emilyshaffer@google.com>
Date: Fri, 13 Sep 2019 13:02:07 -0700
Message-ID: <CAJoAoZm2apzNtkLNHULG1pkUL4U27+DoeVeR9-fgDPyjrBBakw@mail.gmail.com>
Subject: Re: Rant regarding code review issues
To: Ed Tanous <ed.tanous@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Sep 13, 2019 at 12:46 PM Ed Tanous <ed.tanous@intel.com> wrote:
>
> On 9/13/19 11:52 AM, Wilfred Smith wrote:
> >
> > I strongly assert that there should be a formal list of commit rules. I=
f the rules were actually documented and published, one could go through th=
e checklist to ensure that the commit conforms. The result would be less ti=
me wasted by the committer and the reviewers, as well as more consistency.
> >
> https://github.com/openbmc/docs
>
> > But it sucks to have a commit booted for reasons that (a) I could not r=
easonably be expected to have known previously (because I read the document=
ation, of course) and(b) I may legitimately disagree with (e.g. the insanit=
y that anyone
> holds to an 80-column rule instead of 132 in a day of 4K monitors and
> 75-character class names inside nested namespaces that are just as long,
> not counting fully decorated traits). Oh=E2=80=A6right=E2=80=A6just use =
=E2=80=9Cauto=E2=80=9D.
>
> From the coding standard here:
> https://github.com/openbmc/docs/blob/master/cpp-style-and-conventions.md
>
> "Line length should be limited to 80 characters."
>
> You are welcome to disagree with that statement, but the recommended way
> to go about that would be to push a review to change to that rule,
> invoking a 132 character line length, and start a discussion about the
> above.  After that, follow up with changes to the clang-format, and
> commits to each repository to change the codebase to obey the new rule.
> I'm willing to bet if you did that, many people would agree with you,
> and we'd have a very productive discussion about it.

I'll point out that as I understand it, 80c line limit is an
accessibility issue for tools like braille readers or for users who
need to use a larger font size than you may expect.

> Agreed.  I'd also mention that in some cases (like the 50/27 rule and 80
> character line lengths) the CI could give faster feedback for obvious
> things.  Is that something you'd be willing to look into automating in
> the CI?  I'm sure a lot of people would appreciate you doing so.
> There's a lot of low hanging fruit here that could be added to CI to
> make the responses seem less hostile.
>>
> It should be noted, for most code, all of this formatting is automatic
> via clang-format, which is documented on the next line in the file I link=
ed.
>
> With all of the above, I'm struggling to see how you're wanting to
> improve here.  Do you think the documentation could be cleaned up?  Is
> the documentation too long to read?  Should we organize it in a
> different way so that the information above is easier to find?
>
> >
> > The process should be somewhat predictable, preferably programmatic.
>
> Agreed, but throughout this email, I don't see any actionable suggestion
> on how this could be improved.  Could you focus a little more on what
> you think we could change to make this situation better?
>
> >
> > Mind you, I have no problem with complying with the maintainer=E2=80=99=
s rules, but I=E2=80=99d like to have some chance at getting a trivial comm=
it passed on the first shot. Two lines of BitBake config, that actually acc=
omplish what is intended, fetches a half-dozen complaints?

I don't want to be a killjoy here, but I think that's an overly
ambitious goal. I see very, very few code reviews pass with no
complaints on the first try - in this project and in other open source
projects in the wild. I think you may need to dial back your
expectations a little on that front. A more reasonable goal may be
"nit comments only", for example.

>
> Assuming this is the review you're talking about:
> https://gerrit.openbmc-project.xyz/c/openbmc/meta-facebook/+/25145
>
> It was 7 lines of bitbake config, and it followed some project practices
> that are deprecated and trying to be removed.
>
> Interestingly enough, I'm not able to find where we document the 50/72
> rule for commit messages, although I know some editors will enforce it
> when you do your edits.  I would've expected it to be here:
> https://github.com/openbmc/docs/blob/master/CONTRIBUTING.md#submitting-ch=
anges
> Maybe that's an improvement to the docs you could propose?
>
> >
> > It helps the maintainer if committers are able to self-police 98% of th=
e issues, and makes the entire process seem less hostile.
>
> >
> > Also, there are too many places to put the same information. I quoted t=
he warning messages I was remedying in the patch set comments, but summariz=
ed in the commit message because that seemed like the right thing to do. An=
d that got me another downvote.
>
> At the end of the day, the commit message is what most people are
> looking at once the commit is merged, and you put a single line that
> wasn't very descriptive.  The maintainer pointed out that you already
> had the level of detail needed, you just failed to put it in the commit
> message.  Certainly, writing this email took longer than just updating
> the commit message with more detail?

I wonder about this too. In my mind, posting an update based on a code
reviewer's comment - especially for the trivial stuff like "run
clang-format" or "reword the commit message".  If you're finding the
process of updating a code review with comments to involve a lot of
overhead, please cry out for help in IRC - it doesn't have to be :) In
fact, (putting on Git contributor hat) I'll personally volunteer to
answer any and all Git questions you may have via email or IRC PM.


Finally, I'd like to encourage you to think of code reviews not as
"the maintainers are grading my work", but instead as "I am but one
human; together we can do more."  Open source is collaborative in
nature, and a really large part of that is code review - all patches
in open source projects are the result of collaboration between the
primary author and the reviewers, almost all the time. I hope you can
see comments as "here is a thing you may not have known," rather than
"ya big dummy!"

 - Emily
