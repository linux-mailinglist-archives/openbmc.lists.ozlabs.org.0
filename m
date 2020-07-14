Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB4B21EBB8
	for <lists+openbmc@lfdr.de>; Tue, 14 Jul 2020 10:48:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B5Z0q4Yt6zDqXq
	for <lists+openbmc@lfdr.de>; Tue, 14 Jul 2020 18:48:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b30; helo=mail-yb1-xb30.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=FYxKW6Z/; dkim-atps=neutral
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B5Yzr02w3zDqSq
 for <openbmc@lists.ozlabs.org>; Tue, 14 Jul 2020 18:47:18 +1000 (AEST)
Received: by mail-yb1-xb30.google.com with SMTP id a15so7827130ybs.8
 for <openbmc@lists.ozlabs.org>; Tue, 14 Jul 2020 01:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=r+oUPKYZPJ5BDyaE7YY4c7WEpl/To6MLZyQRPvw2is8=;
 b=FYxKW6Z/55h0DWNKqBtx/7VROS6L1f3hZTc5rcpOW8f80jTXChUlKK3vc71Ut7O3re
 LSXd67TNzadh7Ao7dP7WF+ZjjeVl7BzpASiqZplv/XTwVKlN1rOSk2sV8ttg94v8W5Md
 b9TVqNS5Dsm4a4ljX9tOdyAmOcbhzpib2oIr/vVgT9MNYyTghasyPwUiC3pSWjq6TVFS
 oevCECplw8dLHpE80r2gTwh/qXkHJrD6oFi+uUmLzm/3Ovp+INmV4WRdHbZ5y7n4qYSB
 YCihhGqW5k2zMPl5a5T4Zv7ztqMRnS1BF3SUkhylQOIqjl5UO2UUV6BV1GIhOdsN/DXi
 dIjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r+oUPKYZPJ5BDyaE7YY4c7WEpl/To6MLZyQRPvw2is8=;
 b=aPS5fv09SWh0MJm5jEsBu7vzGznpgWurWePLN0HR60BztYAht4v2onfuFgElk0BCh4
 nhLoY5t9r/G9av1ydQvE3jIT+z14vuOXm40hqPz88MFm4wCLtCU3lCIaPRbx8LFuEugm
 Lu8cg/lF68acx+eEXA3ux8xS//VVGoWMrUF08xKckXmXoV4bSMF6b+YliuxMJN0QCG/Z
 RkFTnbwVR459H0bVcEJtu0lgS/2QmIvh3twFXDgHWFqfgQ2CVqXbXrK+hNgDZMhq/bjW
 fIuk4zC2bT+I2czKlsUqw7J3tPXD4OPwVN0WbqXSRJ6Op1mN2AwQnExPn94OM5z9Ek1f
 k3cg==
X-Gm-Message-State: AOAM533x5dyvo0Zes2Gt7ybCgd5G1uh/QLWq3nG+in4a7gGJccrDIZ2P
 83UJu7XXY1OvqbJWUFbdjzGFcGn0mOhwseYbAR5zNg==
X-Google-Smtp-Source: ABdhPJybB2WJzTqT+AdqTYAsJR0wHwIAV7CWFf7PCA3E/r+YjFfc/nctKj+WrtsJYRJ4VBVQ0PTKRmrqABQrPpYKoHQ=
X-Received: by 2002:a25:abc5:: with SMTP id v63mr6352758ybi.148.1594716434518; 
 Tue, 14 Jul 2020 01:47:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAH1kD+actWFeM5ELXC5SzfgK-CM3Uj8UsiaPikTAOkGscsg9Sw@mail.gmail.com>
In-Reply-To: <CAH1kD+actWFeM5ELXC5SzfgK-CM3Uj8UsiaPikTAOkGscsg9Sw@mail.gmail.com>
From: Ed Tanous <ed@tanous.net>
Date: Tue, 14 Jul 2020 01:47:02 -0700
Message-ID: <CACWQX83TLpBxcdNvz1hweUKQojLkZq+05wseqaQRnqk9+_5JfQ@mail.gmail.com>
Subject: Re: OpenAPI for bmcweb
To: Richard Hanley <rhanley@google.com>
Content-Type: multipart/alternative; boundary="00000000000098e7eb05aa62da17"
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

--00000000000098e7eb05aa62da17
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 8, 2020 at 10:04 AM Richard Hanley <rhanley@google.com> wrote:
> I recently started looking into using OpenAPI for Redfish as part of an
internal project, and I want to try using some of that work in bmcweb.
>
> Right now the OpenAPI support for C++ doesn't mesh very well with
nlohmann and boost::beast. Assuming that we can handle the integration,
what concerns or objectections should I keep in mind?
>
> When I brought the topic up a number of months ago, the biggest issue was
increasing the flash size usage. If a solution is made that doesn't bloat
the image, how do people feel about OpenAPI?
>
> Any other thoughts or ideas on the topic?

Way late on the reply to this one;  Meant to send it a while back and lost
track of it.  I'm frankly surprised more people haven't replied, as this
was a pretty popular topic a year or so ago, with several implementations
of generated bindings being proposed.

You might want to be more specific about what you're hoping to get
working.  bmcweb exposes an openapi introspection endpoint today under
/redfish/v1/JsonSchemas
Source:
https://github.com/openbmc/bmcweb/tree/master/static/redfish/v1/JsonSchemas

I'm guessing you're wanting to generate c++ structure definitions for use
within the server to ease serialization and deserialization of endpoint
structures.  (If I'm incorrect in my assumption, disregard what follows)

This has been tried by many, many people over the short span of time that
bmcweb has existed;  Prior to the bmcweb-on-master times, there was also a
competing web stack, written in go, that revolved around generating the
server entirely from schema.   So far as I'm aware, nobody got past the
"Look at this example" phase.  With that said, if you think it's needed,
and would be better than what's there, by all means attempt it;  In the
efforts of saving your time, I'd recommend talking to one of the people
that tried in the past.  First off, one thing that would've helped the past
attempts would be to be clear about what present problem you're trying to
fix, and include some examples of code that you don't like, and what the
equivalent code (once you're done) would look like.  I think that would
help a lot of people provide input.  Full disclosure, several years ago I
spent a day trying to do exactly this, and determined it was a non-starter,
because it added a lot of complexity for some seemingly simple calls.

I'm going to try to summarize the roadblocks that the various efforts hit
(this is by no means a complete list)
1. The redfish OpenAPI is a complete definition of all properties and
endpoints that _could_ exist.   The majority of the openapi model
properties are specified as optional in the definition; Therefore, because
bmcweb/OpenBMC implements a subset of these, there needs to be some kind of
compile time binding spec that determines which of the optional properties
bmcweb _will_ implement.  This also needs to be extended into "which enums
will bmcweb support" and "what validation will we use on certain strings",
as redfish is fairly loose in what it allows for a lot of things, like
resource names, whereas dbus is more stringent.  Adding this auxiliary
definition defeated most of the perceived complexity that OpenAPI would've
improved upon.

2. The generated code was far too verbose to inspect for security problems
line by line.    In one case (I'm not picking on the person that did this
if you're listening) python code read in the spec, and used Jinja to
generate templated c++ structures that were then converted into
serialize/deserialize functions for every endpoint.  Tracing code from a
user given json parameter, to a type-safe c++ parameter that could be
operated on was a mess, and it was difficult to inspect what kind of safety
could be expected for a given variable/structure (example, could this
string contain a unicode character that's disallowed on DBus?).  This could
certainly be optimized and improved in newer attempts, but it's a lot of
effort.

3. So far as I'm aware, nobody even made it to being able to handle the
PATCH case sanely, where most properties are essentially optional, and
there's some binding changes between properties that might have an implied
order.
There have been cases in the past where we've misunderstood the intent
behind the CSDL (XML) definition (before the openapi stuff existed), and
implemented the wrong input parsing code.   The one that comes to mind was
a case where we were accepting an object as a property directly, when it
needed to be an array of properties (usually with size 1) to be
compatible.  In the efforts to not break the people that had already coded
against the "wrong" implementation, we now accept both, but warn on the
former.  Implementing these rare corner backward compatibility cases in
generic code tends to be very difficult.

4. None of the efforts properly implemented the correct error message
handling for missing/bad properties.  This is non-trivial, and about half
of the readJson code (that you would likely be replacing) is simply mapping
the schema violations to the correct Redfish error message.
Binary sizes weren't great (as you've already noted) because they required
redfish to have different parsing code than the rest of the system
(dbus-rest, ect).  This is probably the least of my problems with the
effort, and is something that's certainly solvable from a technical
standpoint.
Because OpenAPI would be run on endpoints that are not yet trusted (like
PATCH /Sessions/) it adds all of the openAPI code to the high risk security
envelope of unauthenticated requests, and increases the effort of those
that manually have to audit the authentication code to meet security
standards.

5. Most of the efforts failed the Redfish schema validator for the
endpoints they produced.  This could certainly be debugged and improved.

6. (opinion) As is, bmcweb already has a problem with submitters not
testing their code.  This is why it now requires running the Redfish
service validator on every change.  Having pre-generated bindings is likely
to make developers assume that their schemas are correct, and are less
likely to run a test beforehand.  With that said, most of the problems


With all of that said, if you're looking to generate something, I think
some low hanging fruit could be found in the permissions definitions.
As-is, there is an implicit expectation that the committer has checked the
Privilege Registry file, and updated their permission definitions
accordingly.  In practice, most commiters don't realize the privilege
registry even exists, and simply copy a parameter from another schema.
This seems like something that's ripe for generated code to generate the
privilege mappings that people could simply #include against.  While we're
in the realm of the beach boys (wouldn't it be nice).  A tool that used the
openapi definitions to "fuzz" redfish would be another great opportunity
for generated code.


-Ed

--00000000000098e7eb05aa62da17
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>On Mon, Jun 8, 2020 at 10:04 AM Richard Hanley &lt;<a=
 href=3D"mailto:rhanley@google.com" target=3D"_blank">rhanley@google.com</a=
>&gt; wrote:<br>
&gt; I recently started looking into using OpenAPI for Redfish as part of a=
n internal project, and I want to try using some of that work in bmcweb.<br=
>&gt;<br>
&gt; Right now the OpenAPI support for C++ doesn&#39;t mesh very well with =
nlohmann and boost::beast. Assuming that we can handle the integration, wha=
t concerns or objectections should I keep in mind?<br>
&gt;<br>
&gt; When I brought the topic up a number of months ago, the biggest issue =
was increasing the flash size usage. If a solution is made that doesn&#39;t=
 bloat the image, how do people feel about OpenAPI?<br>
&gt;<br>
&gt; Any other thoughts or ideas on the topic?<br></div><div><br></div><div=
>
Way late on the reply to this one;=C2=A0 Meant to send it a while back and =
lost track of it.=C2=A0 I&#39;m frankly surprised more people haven&#39;t r=
eplied, as this was a pretty popular topic a year or so ago, with several i=
mplementations of generated bindings being proposed.<br>
<br>
You might want to be more specific about what you&#39;re hoping to get work=
ing.=C2=A0 bmcweb exposes an openapi introspection endpoint today under /re=
dfish/v1/JsonSchemas<br>
Source: <a href=3D"https://github.com/openbmc/bmcweb/tree/master/static/red=
fish/v1/JsonSchemas" rel=3D"noreferrer" target=3D"_blank">https://github.co=
m/openbmc/bmcweb/tree/master/static/redfish/v1/JsonSchemas</a><br>
<br>
I&#39;m guessing you&#39;re wanting to generate c++ structure definitions f=
or use within the server to ease serialization and deserialization of endpo=
int structures.=C2=A0 (If I&#39;m incorrect in my assumption, disregard wha=
t follows)<br>
<br>
This has been tried by many, many people over the short span of time that b=
mcweb has existed;=C2=A0 Prior to the bmcweb-on-master times, there was als=
o a competing web stack, written in go, that revolved around generating the=
 server entirely from schema.=C2=A0 =C2=A0So far as I&#39;m aware, nobody g=
ot past the &quot;Look at this example&quot; phase.=C2=A0 With that said, i=
f you think it&#39;s needed, and would be better than what&#39;s there, by =
all means attempt it;=C2=A0 In the efforts of saving your time, I&#39;d rec=
ommend talking to one of the people that tried in the past.=C2=A0 First off=
, one thing that would&#39;ve helped the past attempts would be to be clear=
 about what present problem you&#39;re trying to fix, and include some exam=
ples of code that you don&#39;t like, and what the equivalent code (once yo=
u&#39;re done) would look like.=C2=A0 I think that would help a lot of peop=
le provide input.=C2=A0 Full disclosure, several years ago I spent a day tr=
ying to do exactly this, and determined it was a non-starter, because it ad=
ded a lot of complexity for some seemingly simple calls.<br>
<br>
I&#39;m going to try to summarize the roadblocks that the various efforts h=
it (this is by no means a complete list)<br><div dir=3D"auto">
1. The redfish OpenAPI is a complete definition of all properties and endpo=
ints that _could_ exist.=C2=A0 =C2=A0The majority of the openapi model prop=
erties are specified as optional in the definition; Therefore, because bmcw=
eb/OpenBMC implements a subset of these, there needs to be some kind of com=
pile time binding spec that determines which of the optional properties bmc=
web _will_ implement.=C2=A0 This also needs to be extended into &quot;which=
 enums will bmcweb support&quot; and &quot;what validation will we use on c=
ertain strings&quot;, as redfish is fairly loose in what it allows for a lo=
t of things, like resource names, whereas dbus is more stringent.=C2=A0 Add=
ing this auxiliary definition defeated most of the perceived complexity tha=
t OpenAPI would&#39;ve improved upon.</div><br>
2. The generated code was far too verbose to inspect for security problems =
line by line.=C2=A0 =C2=A0 In one case (I&#39;m not picking on the person t=
hat did this if you&#39;re listening) python code read in the spec, and use=
d Jinja to generate templated c++ structures that were then converted into =
serialize/deserialize functions for every endpoint.=C2=A0 Tracing code from=
 a user given json parameter, to a type-safe c++ parameter that could be op=
erated on was a mess, and it was difficult to inspect what kind of safety c=
ould be expected for a given variable/structure (example, could this string=
 contain a unicode character that&#39;s disallowed on DBus?).=C2=A0 This co=
uld certainly be optimized and improved in newer attempts, but it&#39;s a l=
ot of effort.</div><div><br>
3. So far as I&#39;m aware, nobody even made it to being able to handle the=
 PATCH case sanely, where most properties are essentially optional, and the=
re&#39;s some binding changes between properties that might have an implied=
 order.<br>
There have been cases in the past where we&#39;ve misunderstood the intent =
behind the CSDL (XML) definition (before the openapi stuff existed), and im=
plemented the wrong input parsing code.=C2=A0 =C2=A0The one that comes to m=
ind was a case where we were accepting an object as a property directly, wh=
en it needed to be an array of properties (usually with size 1) to be compa=
tible.=C2=A0 In the efforts to not break the people that had already coded =
against the &quot;wrong&quot; implementation, we now accept both, but warn =
on the former.=C2=A0 Implementing these rare corner backward compatibility =
cases in generic code tends to be very difficult.</div><div><br>
4. None of the efforts properly implemented the correct error message handl=
ing for missing/bad properties.=C2=A0 This is non-trivial, and about half o=
f the readJson code (that you would likely be replacing) is simply mapping =
the schema violations to the correct Redfish error message.<br>
Binary sizes weren&#39;t great (as you&#39;ve already noted) because they r=
equired redfish to have different parsing code than the rest of the system =
(dbus-rest, ect).=C2=A0 This is probably the least of my problems with the =
effort, and is something that&#39;s certainly solvable from a technical sta=
ndpoint.<br>
Because OpenAPI would be run on endpoints that are not yet trusted (like PA=
TCH /Sessions/) it adds all of the openAPI code to the high risk security e=
nvelope of unauthenticated requests, and increases the effort of those that=
 manually have to audit the authentication code to meet security standards.=
</div><div><br>
5. Most of the efforts failed the Redfish schema validator for the endpoint=
s they produced.=C2=A0 This could certainly be debugged and improved.</div>=
<div><br></div><div>6. (opinion) As is, bmcweb=C2=A0already has a problem w=
ith submitters not testing their code.=C2=A0 This is why it now requires ru=
nning the Redfish service validator on every change.=C2=A0 Having pre-gener=
ated bindings is likely to make developers assume that their schemas are co=
rrect, and are less likely to run a test beforehand.=C2=A0 With that said, =
most of the problems=C2=A0<br>
<br>
<br>
With all of that said, if you&#39;re looking to generate something, I think=
 some low hanging fruit could be found in the permissions definitions.=C2=
=A0 As-is, there is an implicit expectation that the committer has checked =
the Privilege Registry file, and updated their permission definitions accor=
dingly.=C2=A0 In practice, most commiters don&#39;t realize the privilege r=
egistry even exists, and simply copy a parameter from another schema.=C2=A0=
 This seems like something that&#39;s ripe for generated code to generate t=
he privilege mappings that people could simply #include against.=C2=A0 Whil=
e we&#39;re in the realm of the beach boys (wouldn&#39;t it be nice).=C2=A0=
 A tool that used the openapi definitions to &quot;fuzz&quot; redfish would=
 be another great opportunity for generated code.</div><div><br></div><div>=
<br></div><div>
-Ed<br><br>
</div>
</div>

--00000000000098e7eb05aa62da17--
