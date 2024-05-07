Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3468BF277
	for <lists+openbmc@lfdr.de>; Wed,  8 May 2024 01:50:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=AdNZTf0O;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VYw4y4zKGz3cQM
	for <lists+openbmc@lfdr.de>; Wed,  8 May 2024 09:50:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=AdNZTf0O;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1135; helo=mail-yw1-x1135.google.com; envelope-from=wltu@google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VYw4P4Ycqz30TN
	for <openbmc@lists.ozlabs.org>; Wed,  8 May 2024 09:49:57 +1000 (AEST)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-61be4b9869dso39563267b3.1
        for <openbmc@lists.ozlabs.org>; Tue, 07 May 2024 16:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715125793; x=1715730593; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=S1axekUnUmHRDgdSX6t4BJB70cZJz9qAHwzzu3Osnro=;
        b=AdNZTf0OqXJ2Px1kC1nNjs3CSPPuaqtEAMyGtnBGhW83KF9FOBTYR0nwwXMWgld8o4
         NoqVQuAkonM6PeqZW84No7hLP40Q8VlTc3wtbhVN+WePvgp/rCZqCrlqxlt1CqXNdMED
         E9U2UYrxBjOnQmWh7SHMkGpo8pdm5Lap+VQgaR3lObkrlOFYWUuCVfEoPzteSODjb8f1
         4rHIw5XXmfFIkZSyfI90jj9iObB4qphtGfUKfT7xt6q4HhywJ8DzhAVSIhYjsVtp9WJ8
         qCuW9V83zMYyfw3Wn2eVQKv1320N9IGPLZn4rhIE2iJvzN+99prxcMkCVwJimKX3he0Y
         czyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715125793; x=1715730593;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S1axekUnUmHRDgdSX6t4BJB70cZJz9qAHwzzu3Osnro=;
        b=dPQVDR8f66mKDCDumLBP5l6UPOH2YS4fdg2SX4qutz2WEs7SaA8Zmsqm1ecS7X7uj6
         XbaKrF+Fh9RMKgPujMd0/w33k57CVVmppNlb+pP8v56gVJYo82jlHZQIRe9D+px9/nJU
         eM9Nu7EHuOb4vsUA31C8XP/s30QF/FEJuUcAiq2D/t0UA9WePbVGMqn8bedq5K6yGkBR
         Cwb04jLCf4efzne88q34Y5SH2ZNuaac8D7raqKuHrggUrYq7z5L/kaOVHs85i9z4clCh
         P9Q2jvOnjA+MfE5O6t+XHkDwuqKWGsiv0nNkOaRGzm5BfF8b7lbW8U1K24zKaeXhziYz
         asrQ==
X-Gm-Message-State: AOJu0Yyna1/7XkF6hU0xis4A9sHYjaJK6Km3I7C8nc8xtstVgWFgcHy+
	aNzEbD8oF1gW/KOGNxR+H0kzFERGWHv6hvqtjAede1w/w+pGFDLlHWTbp6WKZ/CYtIRkhEsVkVG
	+tqg2EswCK141DuLjI+YgrVJ1y25G5SYnfqjYMIlt4YQ2HWPbd8Kl
X-Google-Smtp-Source: AGHT+IEzv2hoEwbDp+c/2NZT7Ry1Ohg53hw2AosKO5BBioPIq/R4MLbnIVXyVcIbizIbsII7cxycsKWh/R7p2ZFJGyA=
X-Received: by 2002:a05:690c:808:b0:61a:e4f3:555c with SMTP id
 00721157ae682-620861f4173mr13805337b3.8.1715125792706; Tue, 07 May 2024
 16:49:52 -0700 (PDT)
MIME-Version: 1.0
References: <CABoTLcQvFfJPhM=W12Z-QnqRzkRt5TE+g0vunw4MB=aYuo-GPA@mail.gmail.com>
 <CAHwn2Xnwba9qfVFzTW-Hhj7CBd2z2w33+xpx5C3vOO1Pr7W-pQ@mail.gmail.com> <CABoTLcRsk=kZ2-4sOjC8p2C8KzXxnPs62oaJ_6NteeddJPq_tw@mail.gmail.com>
In-Reply-To: <CABoTLcRsk=kZ2-4sOjC8p2C8KzXxnPs62oaJ_6NteeddJPq_tw@mail.gmail.com>
From: Willy Tu <wltu@google.com>
Date: Tue, 7 May 2024 16:49:40 -0700
Message-ID: <CAHwn2Xmv-y-4y7+8CbOAN0YmSJrn7g84F+xt85vTdNGdKycaJw@mail.gmail.com>
Subject: Re: ipmitool fru write 0 - does not update "baseboard" FRU
To: Oskar Senft <osk@google.com>
Content-Type: multipart/alternative; boundary="0000000000009ef67d0617e5d7a2"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ali El-Haj-Mahmoud <aaelhaj@google.com>, Ed Tanous <edtanous@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000009ef67d0617e5d7a2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I think we should make it so that if a different IPMI client tries to write
the Fru we prevent it and only allow one write at a time. I think the
fruCache for Read is mostly from some commands that is dealing with one
device ID multiple times. When reading subsequent ids... then it doesn't do
anything.

I think we will need more discussion on that topic since it will be a
larger refactor to make that work.

Sounds good. Please let me know how it goes.

Willy Tu

On Tue, May 7, 2024 at 10:32=E2=80=AFAM Oskar Senft <osk@google.com> wrote:

> Hi Willy
>
> Thanks for your input!
>
> From what I can tell, the current implementation will fail in wondrous
> ways if there's more than one IPMI client trying to write FRU at the same
> time. The existing getFru guards against changing target devId between
> calls to not hand-out the same cache for different requests. However, thi=
s
> will clearly break when different IPMI clients attempt to write the same =
or
> different FRUs at the same time.
>
> We could argue whether that's a supported use case or if we just assume
> that'll never happen ... it does seem like quite a bit of an edge case,
> though.
>
> I do see it as an issue if there were multiple clients with only one
> writing, but others reading - that'll fail in similarly weird ways.
>
> I'm wondering: Do we want to have the fruCache for _reads_ at all? It
> seems actually quite wrong, since subsequent reads for the same FRU would
> always return the same result, even if the FRU changed through some other
> mechanism.
>
> Let me work on a fix that would use the cache only for writing and would
> keep it around until the timeout expired.
>
> Oskar.
>
> On Fri, May 3, 2024 at 11:38=E2=80=AFAM Willy Tu <wltu@google.com> wrote:
>
>> Hi Oskar,
>>
>> > C) ipmiStorageWriteFruData clears the cache immediately after WriteFru
>> was called. Maybe we should keep that cache around until the timeout
>> expires?
>>
>> It seems like this is an issue of multiple clients taking to ipmid. In
>> the middle of writing... There is another client that is reading or
>> something
>> else and will reset the fruCache as you mentioned. In that case, I think
>> it may be best to refactor it out to use another getFru method... maybe
>> like getFruToWrite
>>
>> Maybe just something like this
>>
>> ```
>> std::vector<uint8_t> getFruToWrite(...){
>>   if (writeTimer->isRunning()) {
>>     return fruCacheForWrite;
>>   }
>>   auto [_, fruCacheForWrite] =3D getFru(...);
>>   return fruCacheForWrite;
>> }
>> ```
>>
>> Also need to change `writeFruCache` and such to use `fruCacheForWrite`
>> and such.
>>
>> Please let me know if that works for you. Feel free to reach out
>> internally for faster feedback.
>>
>> Willy Tu
>>
>> On Thu, May 2, 2024 at 11:32=E2=80=AFAM Oskar Senft <osk@google.com> wro=
te:
>>
>>> Hi everyone
>>>
>>> tl;dr - Attempting "ipmitool fru write" with an input file that
>>> contains additional bytes beyond the actual FRU data does not actually
>>> update the FRU on OpenBMC at head w/ entity-manager.
>>>
>>> Details:
>>>
>>> I ran into an issue with updating the "baseboard" FRU (0), which is
>>> stored as /etc/fru/baseboard.fru.bin. However, I don't think this is
>>> specific to FRU 0 and could apply to other updateable FRUs in the same
>>> way.
>>>
>>>
>>> 1. Start off with a "minimal" /etc/fru/baseboard.fru.bin which just
>>> contains chassis type (that's required for entity-manager's fru-device
>>> to recognize the file.
>>>
>>> root@akita:~# ls -al /etc/fru/baseboard.fru.bin
>>> -rw-r--r--    1 root     root           512 Sep 21 05:21
>>> /etc/fru/baseboard.fru.bin
>>>
>>> root@akita:~# hexdump -C /etc/fru/baseboard.fru.bin
>>> 00000000  01 00 01 00 00 00 00 fe  01 01 17 c0 c0 c1 00 a6
>>> |................|
>>> 00000010  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00
>>> |................|
>>> *
>>> 00000200
>>>
>>> root@akita:~# ipmitool fru print 0
>>>  Chassis Type          : Rack Mount Chassis
>>>  Chassis Area Checksum : OK
>>>
>>>
>>> 2. Prepare a FRU file with additional data, e.g. with frugy:
>>>
>>> (frugy) osk@osk:~$ cat demo.yml
>>> ChassisInfo:
>>>   type: 23
>>>   part_number: '4711'
>>>   serial_number: '12345'
>>>
>>> (frugy) osk@osk:~$ frugy demo.yml -o demo.bin
>>>
>>> (frugy) osk@osk:~$ ls -al demo.bin
>>> -rw-r----- 1 osk primarygroup 24 May  2 13:51 demo.bin
>>>
>>> (frugy) osk@osk:~$ hexdump -C demo.bin
>>> 00000000  01 00 01 00 00 00 00 fe  01 02 17 c4 34 37 31 31
>>> |............4711|
>>> 00000010  c5 31 32 33 34 35 c1 d0                           |.12345..|
>>> 00000018
>>>
>>> Note that frugy generates a minimal binary by default. However, other
>>> processes may not and instead produce a fixed size binary blob. This
>>> happens, e.g. when performing "ipmitool fru read" which returns the
>>> whole contents of the underlying storage. A subsequent "ipmitool fru
>>> write" with that blob will fail as explained here.
>>>
>>> To simulate this here, increase the file to 256 bytes:
>>>
>>> (frugy) osk@osk:~$ cp demo.bin demo-256.bin
>>> (frugy) osk@osk:~$ dd if=3D/dev/zero bs=3D1 seek=3D256 count=3D0 of=3Dd=
emo-256.bin
>>> 0+0 records in
>>> 0+0 records out
>>> 0 bytes copied, 5.1138e-05 s, 0.0 kB/s
>>>
>>> (frugy) osk@osk:~$ ls -al demo-256.bin
>>> -rw-r----- 1 osk primarygroup 256 May  2 13:57 demo-256.bin
>>>
>>> (frugy) osk@osk:~$ hexdump -C demo-256.bin
>>> 00000000  01 00 01 00 00 00 00 fe  01 02 17 c4 34 37 31 31
>>> |............4711|
>>> 00000010  c5 31 32 33 34 35 c1 d0  00 00 00 00 00 00 00 00
>>> |.12345..........|
>>> 00000020  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00
>>> |................|
>>> *
>>> 00000100
>>>
>>>
>>> 3. Write the newly generated FRU:
>>>
>>> root@akita:~# ipmitool fru write 0 demo-256.bin
>>> Fru Size         : 512 bytes
>>> Size to Write    : 256 bytes
>>>
>>> Wait ~10 seconds for the fru-device process to reload the contents.
>>>
>>>
>>> 4. Re-read the FRU contents:
>>>
>>> root@akita:~# ipmitool fru print 0
>>>  Chassis Type          : Rack Mount Chassis
>>>  Chassis Area Checksum : OK
>>>
>>>
>>> 5. For comparison, write only the minimal FRU:
>>>
>>> root@akita:~# ipmitool fru write 0 demo.bin
>>> Fru Size         : 512 bytes
>>> Size to Write    : 24 bytes
>>>
>>> Wait ~10 seconds.
>>>
>>> root@akita:~# ipmitool fru print 0
>>>  Chassis Type          : Rack Mount Chassis
>>>  Chassis Part Number   : 4711
>>>  Chassis Serial        : 12345
>>>  Chassis Area Checksum : OK
>>>
>>>
>>> I dug into this and found that this is caused by an interaction
>>> between
>>> https://github.com/openbmc/phosphor-host-ipmid/blob/master/dbus-sdr/sto=
ragecommands.cpp
>>> and
>>> https://github.com/openbmc/entity-manager/blob/master/src/fru_device.cp=
p
>>> .
>>>
>>> Here's what happens:
>>> - The "ipmitool fru write" request is handled by storagecommands.cpp
>>> ipmiStorageWriteFruData.
>>>
>>> - ipmiStorageWriteFruData receives the whole FRU blob from IPMI across
>>> several calls. On the initial call, it requests the current FRU blob
>>> via D-bus from fru-device and caches it in the process. It then
>>> overwrites sections of that cache with the received data from IPMI.
>>>
>>> - ipmiStorageWriteFruData uses information from the FRU header to
>>> check whether it received all the bytes that make up the new FRU. Note
>>> that this could be fewer bytes than the size of the cached blob. Once
>>> it receives all the bytes for the new FRU, it calls
>>> /xyz/openbmc_project/FruDevice WriteFru via D-Bus with the full FRU
>>> blob (i.e. the full cache with modifications on top). After that the
>>> cache is cleared.
>>>
>>> - The D-Bus call to WriteFru is handled by fru_device.cpp writeFRU. It
>>> first performs a sanity check and then writes the blob to the
>>> underlying device (or the /etc/fru/baseboard.fru.bin for FRU 0). It
>>> subsequently calls rescanBusses() which actually executes after about
>>> 1 second.
>>>
>>> - Meanwhile, "ipmitool fru write" continues to happily send additional
>>> bytes to ipmiStorageWriteFruData (as in step #3 above). Since its
>>> cache has just been cleared, it retrieves the current FRU from
>>> fru-device again. However, since that has not yet completed
>>> "rescanBusses", it actually received the original FRU again, not the
>>> modified version. The above cycle repeats, but this time the original
>>> FRU with additional modifications from the additional bytes.
>>>
>>> In the best case (if the new FRU data is larger than the original FRU
>>> data), the result is that the FRU did not get updated at all, since we
>>> effectively just wrote back the original FRU. However, if the new FRU
>>> data is smaller than the original FRU data, this may result in
>>> corrupted FRU data to be persisted.
>>>
>>>
>>> I was trying to figure out how to best fix that, but couldn't come up
>>> with a design that would still work. Some ideas:
>>>
>>> A)  I think what we're missing is feedback from fru-device to ipmid
>>> that the FRU write operation has actually completed and the FRU data
>>> was re-read. The ipmid should probably not accept any additional write
>>> requests until the previous write request has completed and the new
>>> FRU data is available.
>>>
>>> B) If ipmiStorageWriteFruData cannot detect the expected size of the
>>> FRU data, it relies on a timeout to eventually write the blob if no
>>> more data was received from IPMI. I wonder if this mechanism is "too
>>> clever" and we should simply always just wait for the timeout?
>>>
>>> C) ipmiStorageWriteFruData clears the cache immediately after WriteFru
>>> was called. Maybe we should keep that cache around until the timeout
>>> expires?
>>>
>>> Thoughts?
>>>
>>> Thanks
>>> Oskar.
>>>
>>

--0000000000009ef67d0617e5d7a2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I think we should make it so that if a different IPMI clie=
nt tries to write the Fru we prevent it and only allow one write at a time.=
 I think the fruCache for Read is mostly from some commands that is dealing=
 with one device ID multiple times. When reading subsequent ids... then it =
doesn&#39;t do anything.<div><br></div><div>I think we will need more discu=
ssion on that topic since it will be a larger refactor to make that work.</=
div><div><br></div><div>Sounds good. Please let me know how it goes.</div><=
div><br></div><div>Willy Tu</div></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Tue, May 7, 2024 at 10:32=E2=80=AFAM Os=
kar Senft &lt;<a href=3D"mailto:osk@google.com">osk@google.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"l=
tr">Hi Willy<div><br></div><div>Thanks for your input!=C2=A0</div><div><br>=
</div><div>From=C2=A0what I can tell, the current implementation will fail =
in wondrous ways if there&#39;s more than one IPMI client trying to write F=
RU at the same time. The existing getFru guards against changing target dev=
Id between calls to not hand-out the same cache for different requests. How=
ever, this will clearly break when different=C2=A0IPMI clients attempt to w=
rite the same or different FRUs at the same time.</div><div><br></div><div>=
We could argue whether that&#39;s a supported use case or if we just assume=
 that&#39;ll never happen ... it does seem like quite a bit of an edge case=
, though.</div><div><br></div><div>I do see it as an issue if there were mu=
ltiple clients with only one writing, but others reading - that&#39;ll fail=
 in similarly weird ways.</div><div><br></div><div>I&#39;m wondering: Do we=
 want to have the=C2=A0fruCache for _reads_ at all? It seems actually quite=
 wrong, since subsequent reads for the same FRU would always return the sam=
e result, even if the FRU changed through some other mechanism.</div><div><=
br></div><div>Let me work on a fix that would use the cache only for writin=
g and would keep it around until the timeout expired.</div><div><br></div><=
div>Oskar.</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, May 3, 2024 at 11:38=E2=80=AFAM Willy Tu &lt;<a hre=
f=3D"mailto:wltu@google.com" target=3D"_blank">wltu@google.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"l=
tr">Hi=C2=A0Oskar,<div><br></div><div>&gt; C) ipmiStorageWriteFruData clear=
s the cache immediately after WriteFru was called. Maybe we should keep tha=
t cache around until the timeout expires?</div><div><br></div><div><div>It =
seems like this is an issue of multiple clients taking to ipmid. In the mid=
dle of writing... There is another client that is reading or something</div=
><div>else and will reset the fruCache as you mentioned. In that case, I th=
ink it may be best to refactor it out to use another getFru method... maybe=
 like getFruToWrite</div><div><br></div><div>Maybe just something like this=
</div><div><br></div><div>```</div><div>std::vector&lt;uint8_t&gt; getFruTo=
Write(...){</div><div>=C2=A0 if (writeTimer-&gt;isRunning()) {</div><div>=
=C2=A0 =C2=A0 return fruCacheForWrite;</div><div>=C2=A0 }</div><div>=C2=A0=
=C2=A0auto [_, fruCacheForWrite] =3D getFru(...);</div><div>=C2=A0 return f=
ruCacheForWrite;</div><div>}</div><div>```</div><div><br></div><div>Also ne=
ed to change `writeFruCache` and such to use `fruCacheForWrite` and such.</=
div></div><div><br></div><div>Please let=C2=A0me know if that works for you=
. Feel free to reach out internally for faster feedback.</div><div><br></di=
v><div>Willy Tu</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, May 2, 2024 at 11:32=E2=80=AFAM Oskar Senft &l=
t;<a href=3D"mailto:osk@google.com" target=3D"_blank">osk@google.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi ever=
yone<br>
<br>
tl;dr - Attempting &quot;ipmitool fru write&quot; with an input file that<b=
r>
contains additional bytes beyond the actual FRU data does not actually<br>
update the FRU on OpenBMC at head w/ entity-manager.<br>
<br>
Details:<br>
<br>
I ran into an issue with updating the &quot;baseboard&quot; FRU (0), which =
is<br>
stored as /etc/fru/baseboard.fru.bin. However, I don&#39;t think this is<br=
>
specific to FRU 0 and could apply to other updateable FRUs in the same<br>
way.<br>
<br>
<br>
1. Start off with a &quot;minimal&quot; /etc/fru/baseboard.fru.bin which ju=
st<br>
contains chassis type (that&#39;s required for entity-manager&#39;s fru-dev=
ice<br>
to recognize the file.<br>
<br>
root@akita:~# ls -al /etc/fru/baseboard.fru.bin<br>
-rw-r--r--=C2=A0 =C2=A0 1 root=C2=A0 =C2=A0 =C2=A0root=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0512 Sep 21 05:21<br>
/etc/fru/baseboard.fru.bin<br>
<br>
root@akita:~# hexdump -C /etc/fru/baseboard.fru.bin<br>
00000000=C2=A0 01 00 01 00 00 00 00 fe=C2=A0 01 01 17 c0 c0 c1 00 a6=C2=A0 =
|................|<br>
00000010=C2=A0 00 00 00 00 00 00 00 00=C2=A0 00 00 00 00 00 00 00 00=C2=A0 =
|................|<br>
*<br>
00000200<br>
<br>
root@akita:~# ipmitool fru print 0<br>
=C2=A0Chassis Type=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 : Rack Mount Chassis<b=
r>
=C2=A0Chassis Area Checksum : OK<br>
<br>
<br>
2. Prepare a FRU file with additional data, e.g. with frugy:<br>
<br>
(frugy) osk@osk:~$ cat demo.yml<br>
ChassisInfo:<br>
=C2=A0 type: 23<br>
=C2=A0 part_number: &#39;4711&#39;<br>
=C2=A0 serial_number: &#39;12345&#39;<br>
<br>
(frugy) osk@osk:~$ frugy demo.yml -o demo.bin<br>
<br>
(frugy) osk@osk:~$ ls -al demo.bin<br>
-rw-r----- 1 osk primarygroup 24 May=C2=A0 2 13:51 demo.bin<br>
<br>
(frugy) osk@osk:~$ hexdump -C demo.bin<br>
00000000=C2=A0 01 00 01 00 00 00 00 fe=C2=A0 01 02 17 c4 34 37 31 31=C2=A0 =
|............4711|<br>
00000010=C2=A0 c5 31 32 33 34 35 c1 d0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|.12345..|<br=
>
00000018<br>
<br>
Note that frugy generates a minimal binary by default. However, other<br>
processes may not and instead produce a fixed size binary blob. This<br>
happens, e.g. when performing &quot;ipmitool fru read&quot; which returns t=
he<br>
whole contents of the underlying storage. A subsequent &quot;ipmitool fru<b=
r>
write&quot; with that blob will fail as explained here.<br>
<br>
To simulate this here, increase the file to 256 bytes:<br>
<br>
(frugy) osk@osk:~$ cp demo.bin demo-256.bin<br>
(frugy) osk@osk:~$ dd if=3D/dev/zero bs=3D1 seek=3D256 count=3D0 of=3Ddemo-=
256.bin<br>
0+0 records in<br>
0+0 records out<br>
0 bytes copied, 5.1138e-05 s, 0.0 kB/s<br>
<br>
(frugy) osk@osk:~$ ls -al demo-256.bin<br>
-rw-r----- 1 osk primarygroup 256 May=C2=A0 2 13:57 demo-256.bin<br>
<br>
(frugy) osk@osk:~$ hexdump -C demo-256.bin<br>
00000000=C2=A0 01 00 01 00 00 00 00 fe=C2=A0 01 02 17 c4 34 37 31 31=C2=A0 =
|............4711|<br>
00000010=C2=A0 c5 31 32 33 34 35 c1 d0=C2=A0 00 00 00 00 00 00 00 00=C2=A0 =
|.12345..........|<br>
00000020=C2=A0 00 00 00 00 00 00 00 00=C2=A0 00 00 00 00 00 00 00 00=C2=A0 =
|................|<br>
*<br>
00000100<br>
<br>
<br>
3. Write the newly generated FRU:<br>
<br>
root@akita:~# ipmitool fru write 0 demo-256.bin<br>
Fru Size=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: 512 bytes<br>
Size to Write=C2=A0 =C2=A0 : 256 bytes<br>
<br>
Wait ~10 seconds for the fru-device process to reload the contents.<br>
<br>
<br>
4. Re-read the FRU contents:<br>
<br>
root@akita:~# ipmitool fru print 0<br>
=C2=A0Chassis Type=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 : Rack Mount Chassis<b=
r>
=C2=A0Chassis Area Checksum : OK<br>
<br>
<br>
5. For comparison, write only the minimal FRU:<br>
<br>
root@akita:~# ipmitool fru write 0 demo.bin<br>
Fru Size=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: 512 bytes<br>
Size to Write=C2=A0 =C2=A0 : 24 bytes<br>
<br>
Wait ~10 seconds.<br>
<br>
root@akita:~# ipmitool fru print 0<br>
=C2=A0Chassis Type=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 : Rack Mount Chassis<b=
r>
=C2=A0Chassis Part Number=C2=A0 =C2=A0: 4711<br>
=C2=A0Chassis Serial=C2=A0 =C2=A0 =C2=A0 =C2=A0 : 12345<br>
=C2=A0Chassis Area Checksum : OK<br>
<br>
<br>
I dug into this and found that this is caused by an interaction<br>
between <a href=3D"https://github.com/openbmc/phosphor-host-ipmid/blob/mast=
er/dbus-sdr/storagecommands.cpp" rel=3D"noreferrer" target=3D"_blank">https=
://github.com/openbmc/phosphor-host-ipmid/blob/master/dbus-sdr/storagecomma=
nds.cpp</a><br>
and <a href=3D"https://github.com/openbmc/entity-manager/blob/master/src/fr=
u_device.cpp" rel=3D"noreferrer" target=3D"_blank">https://github.com/openb=
mc/entity-manager/blob/master/src/fru_device.cpp</a>.<br>
<br>
Here&#39;s what happens:<br>
- The &quot;ipmitool fru write&quot; request is handled by storagecommands.=
cpp<br>
ipmiStorageWriteFruData.<br>
<br>
- ipmiStorageWriteFruData receives the whole FRU blob from IPMI across<br>
several calls. On the initial call, it requests the current FRU blob<br>
via D-bus from fru-device and caches it in the process. It then<br>
overwrites sections of that cache with the received data from IPMI.<br>
<br>
- ipmiStorageWriteFruData uses information from the FRU header to<br>
check whether it received all the bytes that make up the new FRU. Note<br>
that this could be fewer bytes than the size of the cached blob. Once<br>
it receives all the bytes for the new FRU, it calls<br>
/xyz/openbmc_project/FruDevice WriteFru via D-Bus with the full FRU<br>
blob (i.e. the full cache with modifications on top). After that the<br>
cache is cleared.<br>
<br>
- The D-Bus call to WriteFru is handled by fru_device.cpp writeFRU. It<br>
first performs a sanity check and then writes the blob to the<br>
underlying device (or the /etc/fru/baseboard.fru.bin for FRU 0). It<br>
subsequently calls rescanBusses() which actually executes after about<br>
1 second.<br>
<br>
- Meanwhile, &quot;ipmitool fru write&quot; continues to happily send addit=
ional<br>
bytes to ipmiStorageWriteFruData (as in step #3 above). Since its<br>
cache has just been cleared, it retrieves the current FRU from<br>
fru-device again. However, since that has not yet completed<br>
&quot;rescanBusses&quot;, it actually received the original FRU again, not =
the<br>
modified version. The above cycle repeats, but this time the original<br>
FRU with additional modifications from the additional bytes.<br>
<br>
In the best case (if the new FRU data is larger than the original FRU<br>
data), the result is that the FRU did not get updated at all, since we<br>
effectively just wrote back the original FRU. However, if the new FRU<br>
data is smaller than the original FRU data, this may result in<br>
corrupted FRU data to be persisted.<br>
<br>
<br>
I was trying to figure out how to best fix that, but couldn&#39;t come up<b=
r>
with a design that would still work. Some ideas:<br>
<br>
A)=C2=A0 I think what we&#39;re missing is feedback from fru-device to ipmi=
d<br>
that the FRU write operation has actually completed and the FRU data<br>
was re-read. The ipmid should probably not accept any additional write<br>
requests until the previous write request has completed and the new<br>
FRU data is available.<br>
<br>
B) If ipmiStorageWriteFruData cannot detect the expected size of the<br>
FRU data, it relies on a timeout to eventually write the blob if no<br>
more data was received from IPMI. I wonder if this mechanism is &quot;too<b=
r>
clever&quot; and we should simply always just wait for the timeout?<br>
<br>
C) ipmiStorageWriteFruData clears the cache immediately after WriteFru<br>
was called. Maybe we should keep that cache around until the timeout<br>
expires?<br>
<br>
Thoughts?<br>
<br>
Thanks<br>
Oskar.<br>
</blockquote></div>
</blockquote></div>
</blockquote></div>

--0000000000009ef67d0617e5d7a2--
