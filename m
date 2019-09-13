Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4464FB26E7
	for <lists+openbmc@lfdr.de>; Fri, 13 Sep 2019 22:54:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46VSYw47VszF3r2
	for <lists+openbmc@lfdr.de>; Sat, 14 Sep 2019 06:54:44 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=johnathanx.mantey@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46VSY82lxTzF5nx
 for <openbmc@lists.ozlabs.org>; Sat, 14 Sep 2019 06:53:57 +1000 (AEST)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Sep 2019 13:53:54 -0700
X-IronPort-AV: E=Sophos;i="5.64,492,1559545200"; 
 d="asc'?scan'208,217";a="179794722"
Received: from jmanteyx-desk.jf.intel.com ([10.54.51.79])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/AES256-SHA;
 13 Sep 2019 13:53:53 -0700
Subject: Re: Rant regarding code review issues
To: Emily Shaffer <emilyshaffer@google.com>, Ed Tanous <ed.tanous@intel.com>
References: <EB0500AF-9574-4007-BE55-B6E7384D027C@fb.com>
 <f5205bbe-7320-67ee-2b2d-91c5cc185b02@intel.com>
 <CAJoAoZm2apzNtkLNHULG1pkUL4U27+DoeVeR9-fgDPyjrBBakw@mail.gmail.com>
From: Johnathan Mantey <johnathanx.mantey@intel.com>
Openpgp: preference=signencrypt
Autocrypt: addr=johnathanx.mantey@intel.com; prefer-encrypt=mutual; keydata=
 mQENBFija08BCAC60TO2X22b0tJ2Gy2iQLWx20mGcD7ugBpm1o2IW2M+um3GR0BG/bUcLciw
 dEnX9SWT30jx8TimenyUYeDS1CKML/e4JnCAUhSktNZRPBjzla991OkpqtFJEHj/pHrXTsz0
 ODhmnSaZ49TsY+5BqtRMexICYOtSP8+xuftPN7g2pQNFi7xYlQkutP8WKIY3TacW/6MPiYek
 pqVaaF0cXynCMDvbK0km7m0S4X01RZFKXUwlbuMireNk4IyZ/59hN+fh1MYMQ6RXOgmHqxSu
 04GjkbBLf2Sddplb6KzPMRWPJ5uNdvlkAfyT4P0R5EfkV5wCRdoJ1lNC9WI1bqHkbt07ABEB
 AAG0JUpvaG5hdGhhbiBNYW50ZXkgPG1hbnRleWpnQGdtYWlsLmNvbT6JATcEEwEIACEFAlij
 a08CGwMFCwkIBwIGFQgJCgsCBBYCAwECHgECF4AACgkQ0EfviT3fHwmcBAgAkENzQ8s0RK+f
 nr4UogrCBS132lDdtlOypm1WgGDOVQNra7A1rvXFgN05RqrdRTpRevv7+S8ipbiG/kxn9P8+
 VhhW1SvUT8Tvkb9YYHos6za3v0YblibFNbYRgQcybYMeKz2/DcVU+ioKZ1SxNJsFXx6wH71I
 V2YumQRHAsh4Je6CmsiMVP4XNadzCQXzzcU9sstKV0A194JM/d8hjXfwMHZE6qnKgAkHIV3Q
 61YCuvkdr5SJSrOVo2IMN0pVxhhW7lqCAGBGb4oOhqePwGqOabU3Ui4qTbHP2BWP5UscehkK
 6TVKcpYApsUcWyxvvOARoktmlPnGYqJPnRwXpQBlqLkBDQRYo2tPAQgAyOv5Lgg2VkHO84R7
 LJJDBxcaCDjyAvHBynznEEk11JHrPuonEWi6pqgB8+Kc588/GerXZqJ9AMkR43UW/5cPlyF2
 wVO4aYaQwryDtiXEu+5rpbQfAvBpKTbrBfYIPc8thuAC2kdB4IO24T6PVSYVXYc/giOL0Iwb
 /WZfMd5ajtKfa727xfbKCEHlzakqmUl0SyrARdrSynhX1R9Wnf2BwtUV7mxFxtMukak0zdTf
 2IXZXDltZC224vWqkXiI7Gt/FDc2y6gcsYY/4a2+vjhWuZk3lEzP0pbXQqOseDM1zZXln/m7
 BFbJ6VUn1zWcrt0c82GTMqkeGUheUhDiYLQ7xwARAQABiQEfBBgBCAAJBQJYo2tPAhsMAAoJ
 ENBH74k93x8JKEUH/3UPZryjmM0F3h8I0ZWuruxAxiqvksLOOtarU6RikIAHhwjvluEcTH4E
 JsDjqtRUvBMU907XNotpqpW2e9jN8tFRyR4wW9CYkilB02qgrDm9DXVGb2BDtC/MY+6KUgsG
 k5Ftr9uaXNd0K4IGRJSyU6ZZn0inTcXlqD+NgOE2eX9qpeKEhDufgF7fKHbKDkS4hj6Z09dT
 Y8eW9d6d2Yf/RzTBJvZxjBFbIgeUGeykbSKztp2OBe6mecpVPhKooTq+X/mJehpRA6mAhuQZ
 28lvie7hbRFjqR3JB7inAKL4eT1/9bT/MqcPh43PXTAzB6/Iclg5B7GGgEFe27VL0hyqiqc=
Message-ID: <c15e0e55-bc0f-fbeb-2250-20330a87a50a@intel.com>
Date: Fri, 13 Sep 2019 13:53:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAJoAoZm2apzNtkLNHULG1pkUL4U27+DoeVeR9-fgDPyjrBBakw@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="HaXKHx33NTaXteZmS0xEl8woLaGPW1RAW"
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

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--HaXKHx33NTaXteZmS0xEl8woLaGPW1RAW
Content-Type: multipart/mixed; boundary="hoHxnx9NLy12WNEz8V5cE3MEJ9SuY4vY5";
 protected-headers="v1"
From: Johnathan Mantey <johnathanx.mantey@intel.com>
To: Emily Shaffer <emilyshaffer@google.com>, Ed Tanous <ed.tanous@intel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Message-ID: <c15e0e55-bc0f-fbeb-2250-20330a87a50a@intel.com>
Subject: Re: Rant regarding code review issues
References: <EB0500AF-9574-4007-BE55-B6E7384D027C@fb.com>
 <f5205bbe-7320-67ee-2b2d-91c5cc185b02@intel.com>
 <CAJoAoZm2apzNtkLNHULG1pkUL4U27+DoeVeR9-fgDPyjrBBakw@mail.gmail.com>
In-Reply-To: <CAJoAoZm2apzNtkLNHULG1pkUL4U27+DoeVeR9-fgDPyjrBBakw@mail.gmail.com>

--hoHxnx9NLy12WNEz8V5cE3MEJ9SuY4vY5
Content-Type: multipart/alternative;
 boundary="------------699BCA7B4B1FFA6DF3B451DA"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------699BCA7B4B1FFA6DF3B451DA
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

I watched a presentation online where the presenter used long lines.=C2=A0=
 It
was impossible to understand his content because of the long lines.=C2=A0=
 He
was constantly scrolling left/right, effectively obfuscating the code.=C2=
=A0

Likewise, if you're going to cut code into a presentation slide deck it
requires no effort to get it to fit on the slide when the line length is
80c non-proportional.

I prefer 80c/line because it requires less eye motion to read.=C2=A0
It requires less hand motion, in the event you have to scroll left/right.=

It reduces the need to mentally unroll a line should you have line
wrapping enabled, and the line exceeds your screen/display width.
It reduces the need to mentally combine a line in the event you are
scrolling right/left.

Sadly C++ encourages long lines because of its verbosity.

On 9/13/19 1:02 PM, Emily Shaffer wrote:
> On Fri, Sep 13, 2019 at 12:46 PM Ed Tanous <ed.tanous@intel.com> wrote:=

>> On 9/13/19 11:52 AM, Wilfred Smith wrote:
>>> I strongly assert that there should be a formal list of commit rules.=
 If the rules were actually documented and published, one could go throug=
h the checklist to ensure that the commit conforms. The result would be l=
ess time wasted by the committer and the reviewers, as well as more consi=
stency.
>>>
>> https://github.com/openbmc/docs
>>
>>> But it sucks to have a commit booted for reasons that (a) I could not=
 reasonably be expected to have known previously (because I read the docu=
mentation, of course) and(b) I may legitimately disagree with (e.g. the i=
nsanity that anyone
>> holds to an 80-column rule instead of 132 in a day of 4K monitors and
>> 75-character class names inside nested namespaces that are just as lon=
g,
>> not counting fully decorated traits). Oh=E2=80=A6right=E2=80=A6just us=
e =E2=80=9Cauto=E2=80=9D.
>>
>> From the coding standard here:
>> https://github.com/openbmc/docs/blob/master/cpp-style-and-conventions.=
md
>>
>> "Line length should be limited to 80 characters."
>>
>> You are welcome to disagree with that statement, but the recommended w=
ay
>> to go about that would be to push a review to change to that rule,
>> invoking a 132 character line length, and start a discussion about the=

>> above.  After that, follow up with changes to the clang-format, and
>> commits to each repository to change the codebase to obey the new rule=
=2E
>> I'm willing to bet if you did that, many people would agree with you,
>> and we'd have a very productive discussion about it.
> I'll point out that as I understand it, 80c line limit is an
> accessibility issue for tools like braille readers or for users who
> need to use a larger font size than you may expect.
>
>> Agreed.  I'd also mention that in some cases (like the 50/27 rule and =
80
>> character line lengths) the CI could give faster feedback for obvious
>> things.  Is that something you'd be willing to look into automating in=

>> the CI?  I'm sure a lot of people would appreciate you doing so.
>> There's a lot of low hanging fruit here that could be added to CI to
>> make the responses seem less hostile.
>> It should be noted, for most code, all of this formatting is automatic=

>> via clang-format, which is documented on the next line in the file I l=
inked.
>>
>> With all of the above, I'm struggling to see how you're wanting to
>> improve here.  Do you think the documentation could be cleaned up?  Is=

>> the documentation too long to read?  Should we organize it in a
>> different way so that the information above is easier to find?
>>
>>> The process should be somewhat predictable, preferably programmatic.
>> Agreed, but throughout this email, I don't see any actionable suggesti=
on
>> on how this could be improved.  Could you focus a little more on what
>> you think we could change to make this situation better?
>>
>>> Mind you, I have no problem with complying with the maintainer=E2=80=99=
s rules, but I=E2=80=99d like to have some chance at getting a trivial co=
mmit passed on the first shot. Two lines of BitBake config, that actually=
 accomplish what is intended, fetches a half-dozen complaints?
> I don't want to be a killjoy here, but I think that's an overly
> ambitious goal. I see very, very few code reviews pass with no
> complaints on the first try - in this project and in other open source
> projects in the wild. I think you may need to dial back your
> expectations a little on that front. A more reasonable goal may be
> "nit comments only", for example.
>
>> Assuming this is the review you're talking about:
>> https://gerrit.openbmc-project.xyz/c/openbmc/meta-facebook/+/25145
>>
>> It was 7 lines of bitbake config, and it followed some project practic=
es
>> that are deprecated and trying to be removed.
>>
>> Interestingly enough, I'm not able to find where we document the 50/72=

>> rule for commit messages, although I know some editors will enforce it=

>> when you do your edits.  I would've expected it to be here:
>> https://github.com/openbmc/docs/blob/master/CONTRIBUTING.md#submitting=
-changes
>> Maybe that's an improvement to the docs you could propose?
>>
>>> It helps the maintainer if committers are able to self-police 98% of =
the issues, and makes the entire process seem less hostile.
>>> Also, there are too many places to put the same information. I quoted=
 the warning messages I was remedying in the patch set comments, but summ=
arized in the commit message because that seemed like the right thing to =
do. And that got me another downvote.
>> At the end of the day, the commit message is what most people are
>> looking at once the commit is merged, and you put a single line that
>> wasn't very descriptive.  The maintainer pointed out that you already
>> had the level of detail needed, you just failed to put it in the commi=
t
>> message.  Certainly, writing this email took longer than just updating=

>> the commit message with more detail?
> I wonder about this too. In my mind, posting an update based on a code
> reviewer's comment - especially for the trivial stuff like "run
> clang-format" or "reword the commit message".  If you're finding the
> process of updating a code review with comments to involve a lot of
> overhead, please cry out for help in IRC - it doesn't have to be :) In
> fact, (putting on Git contributor hat) I'll personally volunteer to
> answer any and all Git questions you may have via email or IRC PM.
>
>
> Finally, I'd like to encourage you to think of code reviews not as
> "the maintainers are grading my work", but instead as "I am but one
> human; together we can do more."  Open source is collaborative in
> nature, and a really large part of that is code review - all patches
> in open source projects are the result of collaboration between the
> primary author and the reviewers, almost all the time. I hope you can
> see comments as "here is a thing you may not have known," rather than
> "ya big dummy!"
>
>  - Emily

--=20
Johnathan Mantey
Senior Software Engineer
*azad te**chnology partners*
Contributing to Technology Innovation since 1992
Phone: (503) 712-6764
Email: johnathanx.mantey@intel.com <mailto:johnathanx.mantey@intel.com>


--------------699BCA7B4B1FFA6DF3B451DA
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body bgcolor=3D"#FFFFFF" text=3D"#000000">
    I watched a presentation online where the presenter used long
    lines.=C2=A0 It was impossible to understand his content because of t=
he
    long lines.=C2=A0 He was constantly scrolling left/right, effectively=

    obfuscating the code.=C2=A0 <br>
    <br>
    Likewise, if you're going to cut code into a presentation slide deck
    it requires no effort to get it to fit on the slide when the line
    length is 80c non-proportional.<br>
    <br>
    I prefer 80c/line because it requires less eye motion to read.=C2=A0 =
<br>
    It requires less hand motion, in the event you have to scroll
    left/right.<br>
    It reduces the need to mentally unroll a line should you have line
    wrapping enabled, and the line exceeds your screen/display width.<br>=

    It reduces the need to mentally combine a line in the event you are
    scrolling right/left.<br>
    <br>
    Sadly C++ encourages long lines because of its verbosity.<br>
    <br>
    <div class=3D"moz-cite-prefix">On 9/13/19 1:02 PM, Emily Shaffer
      wrote:<br>
    </div>
    <blockquote type=3D"cite"
cite=3D"mid:CAJoAoZm2apzNtkLNHULG1pkUL4U27+DoeVeR9-fgDPyjrBBakw@mail.gmai=
l.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">On Fri, Sep 13, 2019 at 12:4=
6 PM Ed Tanous <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:ed.tanou=
s@intel.com">&lt;ed.tanous@intel.com&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">
On 9/13/19 11:52 AM, Wilfred Smith wrote:
</pre>
        <blockquote type=3D"cite">
          <pre class=3D"moz-quote-pre" wrap=3D"">
I strongly assert that there should be a formal list of commit rules. If =
the rules were actually documented and published, one could go through th=
e checklist to ensure that the commit conforms. The result would be less =
time wasted by the committer and the reviewers, as well as more consisten=
cy.

</pre>
        </blockquote>
        <pre class=3D"moz-quote-pre" wrap=3D""><a class=3D"moz-txt-link-f=
reetext" href=3D"https://github.com/openbmc/docs">https://github.com/open=
bmc/docs</a>

</pre>
        <blockquote type=3D"cite">
          <pre class=3D"moz-quote-pre" wrap=3D"">But it sucks to have a c=
ommit booted for reasons that (a) I could not reasonably be expected to h=
ave known previously (because I read the documentation, of course) and(b)=
 I may legitimately disagree with (e.g. the insanity that anyone
</pre>
        </blockquote>
        <pre class=3D"moz-quote-pre" wrap=3D"">holds to an 80-column rule=
 instead of 132 in a day of 4K monitors and
75-character class names inside nested namespaces that are just as long,
not counting fully decorated traits). Oh=E2=80=A6right=E2=80=A6just use =E2=
=80=9Cauto=E2=80=9D.

=46rom the coding standard here:
<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/openbmc/doc=
s/blob/master/cpp-style-and-conventions.md">https://github.com/openbmc/do=
cs/blob/master/cpp-style-and-conventions.md</a>

"Line length should be limited to 80 characters."

You are welcome to disagree with that statement, but the recommended way
to go about that would be to push a review to change to that rule,
invoking a 132 character line length, and start a discussion about the
above.  After that, follow up with changes to the clang-format, and
commits to each repository to change the codebase to obey the new rule.
I'm willing to bet if you did that, many people would agree with you,
and we'd have a very productive discussion about it.
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
I'll point out that as I understand it, 80c line limit is an
accessibility issue for tools like braille readers or for users who
need to use a larger font size than you may expect.

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">Agreed.  I'd also mention =
that in some cases (like the 50/27 rule and 80
character line lengths) the CI could give faster feedback for obvious
things.  Is that something you'd be willing to look into automating in
the CI?  I'm sure a lot of people would appreciate you doing so.
There's a lot of low hanging fruit here that could be added to CI to
make the responses seem less hostile.
</pre>
        <blockquote type=3D"cite">
          <pre class=3D"moz-quote-pre" wrap=3D"">
</pre>
        </blockquote>
        <pre class=3D"moz-quote-pre" wrap=3D"">It should be noted, for mo=
st code, all of this formatting is automatic
via clang-format, which is documented on the next line in the file I link=
ed.

With all of the above, I'm struggling to see how you're wanting to
improve here.  Do you think the documentation could be cleaned up?  Is
the documentation too long to read?  Should we organize it in a
different way so that the information above is easier to find?

</pre>
        <blockquote type=3D"cite">
          <pre class=3D"moz-quote-pre" wrap=3D"">
The process should be somewhat predictable, preferably programmatic.
</pre>
        </blockquote>
        <pre class=3D"moz-quote-pre" wrap=3D"">
Agreed, but throughout this email, I don't see any actionable suggestion
on how this could be improved.  Could you focus a little more on what
you think we could change to make this situation better?

</pre>
        <blockquote type=3D"cite">
          <pre class=3D"moz-quote-pre" wrap=3D"">
Mind you, I have no problem with complying with the maintainer=E2=80=99s =
rules, but I=E2=80=99d like to have some chance at getting a trivial comm=
it passed on the first shot. Two lines of BitBake config, that actually a=
ccomplish what is intended, fetches a half-dozen complaints?
</pre>
        </blockquote>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
I don't want to be a killjoy here, but I think that's an overly
ambitious goal. I see very, very few code reviews pass with no
complaints on the first try - in this project and in other open source
projects in the wild. I think you may need to dial back your
expectations a little on that front. A more reasonable goal may be
"nit comments only", for example.

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">
Assuming this is the review you're talking about:
<a class=3D"moz-txt-link-freetext" href=3D"https://gerrit.openbmc-project=
=2Exyz/c/openbmc/meta-facebook/+/25145">https://gerrit.openbmc-project.xy=
z/c/openbmc/meta-facebook/+/25145</a>

It was 7 lines of bitbake config, and it followed some project practices
that are deprecated and trying to be removed.

Interestingly enough, I'm not able to find where we document the 50/72
rule for commit messages, although I know some editors will enforce it
when you do your edits.  I would've expected it to be here:
<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/openbmc/doc=
s/blob/master/CONTRIBUTING.md#submitting-changes">https://github.com/open=
bmc/docs/blob/master/CONTRIBUTING.md#submitting-changes</a>
Maybe that's an improvement to the docs you could propose?

</pre>
        <blockquote type=3D"cite">
          <pre class=3D"moz-quote-pre" wrap=3D"">
It helps the maintainer if committers are able to self-police 98% of the =
issues, and makes the entire process seem less hostile.
</pre>
        </blockquote>
        <pre class=3D"moz-quote-pre" wrap=3D"">
</pre>
        <blockquote type=3D"cite">
          <pre class=3D"moz-quote-pre" wrap=3D"">
Also, there are too many places to put the same information. I quoted the=
 warning messages I was remedying in the patch set comments, but summariz=
ed in the commit message because that seemed like the right thing to do. =
And that got me another downvote.
</pre>
        </blockquote>
        <pre class=3D"moz-quote-pre" wrap=3D"">
At the end of the day, the commit message is what most people are
looking at once the commit is merged, and you put a single line that
wasn't very descriptive.  The maintainer pointed out that you already
had the level of detail needed, you just failed to put it in the commit
message.  Certainly, writing this email took longer than just updating
the commit message with more detail?
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
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
</pre>
    </blockquote>
    <br>
    <div class=3D"moz-signature">-- <br>
      <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DU=
TF-8">
      <title></title>
      <font color=3D"#1F497D"><font face=3D"Century Gothic">Johnathan Man=
tey<br>
          <small>Senior Software Engineer</small><br>
          <big><font color=3D"#555555"><small><b>azad te</b><b>chnology
                  partners</b></small><br>
              <small><font color=3D"#1F497D"><small>Contributing to
                    Technology Innovation since 1992</small></font><small=
><br>
                  <font color=3D"#1F497D">Phone: (503) 712-6764<br>
                    Email: <a href=3D"mailto:johnathanx.mantey@intel.com"=
>johnathanx.mantey@intel.com</a></font></small><br>
                <br>
              </small></font></big></font></font> </div>
  </body>
</html>

--------------699BCA7B4B1FFA6DF3B451DA--

--hoHxnx9NLy12WNEz8V5cE3MEJ9SuY4vY5--

--HaXKHx33NTaXteZmS0xEl8woLaGPW1RAW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEVa822oZtYaVqAzq50EfviT3fHwkFAl18AdoACgkQ0EfviT3f
Hwl+bAf/Uk27wfLIe0uBGlgPwxcbdmUx3Qm5EYympiINfQorzjaRwOgHsmAivT/o
DgitJt6vfMeUSFn2b82KrREN3Z3FW0CQmhuqeSiICmL1fqzq3GDqtznB+FB2JApE
3c5jnWwgLp3MbpZdZNWUEr6rarovpZ6Mm6ec8Z6UR2WoVthS3BovA+UateqeQ+NZ
nXIsoF7JTVbFAgwzmXocsuC2GqWzRLfBxoTg+x4J6bhHkGkb8Jxv3BxRfdPqlZJA
LhndqmxUDbG/4UPVSxXFWLauMbExpreODVTBvnCS2IjqXgrJ5M3sncnPqk/6+iOr
kHp3WsZ/7pMs46nf/s/uky9EqVXtRg==
=zH37
-----END PGP SIGNATURE-----

--HaXKHx33NTaXteZmS0xEl8woLaGPW1RAW--
