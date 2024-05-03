Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1178BB024
	for <lists+openbmc@lfdr.de>; Fri,  3 May 2024 17:39:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=2EFMbFEJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VWFMv2Mljz3d9s
	for <lists+openbmc@lfdr.de>; Sat,  4 May 2024 01:39:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=2EFMbFEJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::f36; helo=mail-qv1-xf36.google.com; envelope-from=wltu@google.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VWFMM162tz3d32
	for <openbmc@lists.ozlabs.org>; Sat,  4 May 2024 01:38:38 +1000 (AEST)
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-6a05f376effso68482526d6.0
        for <openbmc@lists.ozlabs.org>; Fri, 03 May 2024 08:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714750715; x=1715355515; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vCtFdLz3J00pha+WgxpsfeL+rvXC4ViMewvZ0Hxdvos=;
        b=2EFMbFEJ8z29/ZjvreDcwf210h5SZaHPw0pJ41ZfJVv5gAZqkOgPbRe9VoVc7Jb1OH
         cbiKrE2Q2k8UDWF+zBHOibKyduwySxsfWgjhdOoE5YAqZgHNW28nE8tWBFCHGg4lzY3W
         P9mXLEq/XkQ/kHhRAVZhusMp/lq8vJJhHxHM/KRof6v9O+QVh12PAaurhTvh3WgXUA5t
         xqC0ZSPLMWmfdSpXPr9sN1PVHd/ds9bzjXvfcxVL02BhA1APK3DZgGlHK5tfcleElKXy
         pxwyx0RylOB2E6hsl3nOQuzS4B2RizJZzWsdPSD2ysxi+O8fHYeXjpP7HzYnHRS9jWNb
         XJEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714750715; x=1715355515;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vCtFdLz3J00pha+WgxpsfeL+rvXC4ViMewvZ0Hxdvos=;
        b=Nk2QCR8o5x2oR32KtapryTN8nZGwacZv9vGhwD9D3NJ/HAFdM5XwlSt73kQWwZsxRy
         q/7O8bDNe8tGyOn2/IbjYX2W39jwTtsr2Ohslp/y1j+q0cuHXlk08lflqKVLxcCGdQ/k
         +bSHr2WuhYHqtpaa202Chyv1qCn3Pi5cvqEnrrR7h1ZBlTfriRWyplt9y7OuY+Pzexp+
         VMt56OpoqFC9NpmbkrQupc0ERZNxDLoLoYNrbsQvxJFFn6c45M9xcAX70spK/BeyAmJa
         ortoOlM3YKCVOrHlYXglp3WhnlLrJtAMpC7Q2rgza6HtbPVmNRkiZ+OkdYgIOWLVib4c
         4Yag==
X-Gm-Message-State: AOJu0Yznu4vdKbS48dnQSq7zDlRlo3gmSzp8/GoYwGNjELupLGlQsvoI
	Qt3mBc7fP4RVl/Jl3m3UjOZc3gH7boiZB6k0u7mX6C8SjIQZEF8V5WCpO42FAzCsusaigY42ENC
	ypENfbFtjctiAEbzR2F1Ewp1yOY2RmRNrM29Q
X-Google-Smtp-Source: AGHT+IG96MoNHu3ebJatqhRobj6dO8s0IDqIkTuASxkVifJE/B6AksMvriiMJIlYXD0sdT98lMrlkX7+PmqXeYoocy8=
X-Received: by 2002:a05:6214:2269:b0:6a0:b352:f3b0 with SMTP id
 gs9-20020a056214226900b006a0b352f3b0mr3364678qvb.39.1714750715051; Fri, 03
 May 2024 08:38:35 -0700 (PDT)
MIME-Version: 1.0
References: <CABoTLcQvFfJPhM=W12Z-QnqRzkRt5TE+g0vunw4MB=aYuo-GPA@mail.gmail.com>
In-Reply-To: <CABoTLcQvFfJPhM=W12Z-QnqRzkRt5TE+g0vunw4MB=aYuo-GPA@mail.gmail.com>
From: Willy Tu <wltu@google.com>
Date: Fri, 3 May 2024 08:38:24 -0700
Message-ID: <CAHwn2Xnwba9qfVFzTW-Hhj7CBd2z2w33+xpx5C3vOO1Pr7W-pQ@mail.gmail.com>
Subject: Re: ipmitool fru write 0 - does not update "baseboard" FRU
To: Oskar Senft <osk@google.com>
Content-Type: multipart/alternative; boundary="000000000000401fcb06178e83a3"
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

--000000000000401fcb06178e83a3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Oskar,

> C) ipmiStorageWriteFruData clears the cache immediately after WriteFru
was called. Maybe we should keep that cache around until the timeout
expires?

It seems like this is an issue of multiple clients taking to ipmid. In the
middle of writing... There is another client that is reading or something
else and will reset the fruCache as you mentioned. In that case, I think it
may be best to refactor it out to use another getFru method... maybe like
getFruToWrite

Maybe just something like this

```
std::vector<uint8_t> getFruToWrite(...){
  if (writeTimer->isRunning()) {
    return fruCacheForWrite;
  }
  auto [_, fruCacheForWrite] =3D getFru(...);
  return fruCacheForWrite;
}
```

Also need to change `writeFruCache` and such to use `fruCacheForWrite` and
such.

Please let me know if that works for you. Feel free to reach out internally
for faster feedback.

Willy Tu

On Thu, May 2, 2024 at 11:32=E2=80=AFAM Oskar Senft <osk@google.com> wrote:

> Hi everyone
>
> tl;dr - Attempting "ipmitool fru write" with an input file that
> contains additional bytes beyond the actual FRU data does not actually
> update the FRU on OpenBMC at head w/ entity-manager.
>
> Details:
>
> I ran into an issue with updating the "baseboard" FRU (0), which is
> stored as /etc/fru/baseboard.fru.bin. However, I don't think this is
> specific to FRU 0 and could apply to other updateable FRUs in the same
> way.
>
>
> 1. Start off with a "minimal" /etc/fru/baseboard.fru.bin which just
> contains chassis type (that's required for entity-manager's fru-device
> to recognize the file.
>
> root@akita:~# ls -al /etc/fru/baseboard.fru.bin
> -rw-r--r--    1 root     root           512 Sep 21 05:21
> /etc/fru/baseboard.fru.bin
>
> root@akita:~# hexdump -C /etc/fru/baseboard.fru.bin
> 00000000  01 00 01 00 00 00 00 fe  01 01 17 c0 c0 c1 00 a6
> |................|
> 00000010  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00
> |................|
> *
> 00000200
>
> root@akita:~# ipmitool fru print 0
>  Chassis Type          : Rack Mount Chassis
>  Chassis Area Checksum : OK
>
>
> 2. Prepare a FRU file with additional data, e.g. with frugy:
>
> (frugy) osk@osk:~$ cat demo.yml
> ChassisInfo:
>   type: 23
>   part_number: '4711'
>   serial_number: '12345'
>
> (frugy) osk@osk:~$ frugy demo.yml -o demo.bin
>
> (frugy) osk@osk:~$ ls -al demo.bin
> -rw-r----- 1 osk primarygroup 24 May  2 13:51 demo.bin
>
> (frugy) osk@osk:~$ hexdump -C demo.bin
> 00000000  01 00 01 00 00 00 00 fe  01 02 17 c4 34 37 31 31
> |............4711|
> 00000010  c5 31 32 33 34 35 c1 d0                           |.12345..|
> 00000018
>
> Note that frugy generates a minimal binary by default. However, other
> processes may not and instead produce a fixed size binary blob. This
> happens, e.g. when performing "ipmitool fru read" which returns the
> whole contents of the underlying storage. A subsequent "ipmitool fru
> write" with that blob will fail as explained here.
>
> To simulate this here, increase the file to 256 bytes:
>
> (frugy) osk@osk:~$ cp demo.bin demo-256.bin
> (frugy) osk@osk:~$ dd if=3D/dev/zero bs=3D1 seek=3D256 count=3D0 of=3Ddem=
o-256.bin
> 0+0 records in
> 0+0 records out
> 0 bytes copied, 5.1138e-05 s, 0.0 kB/s
>
> (frugy) osk@osk:~$ ls -al demo-256.bin
> -rw-r----- 1 osk primarygroup 256 May  2 13:57 demo-256.bin
>
> (frugy) osk@osk:~$ hexdump -C demo-256.bin
> 00000000  01 00 01 00 00 00 00 fe  01 02 17 c4 34 37 31 31
> |............4711|
> 00000010  c5 31 32 33 34 35 c1 d0  00 00 00 00 00 00 00 00
> |.12345..........|
> 00000020  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00
> |................|
> *
> 00000100
>
>
> 3. Write the newly generated FRU:
>
> root@akita:~# ipmitool fru write 0 demo-256.bin
> Fru Size         : 512 bytes
> Size to Write    : 256 bytes
>
> Wait ~10 seconds for the fru-device process to reload the contents.
>
>
> 4. Re-read the FRU contents:
>
> root@akita:~# ipmitool fru print 0
>  Chassis Type          : Rack Mount Chassis
>  Chassis Area Checksum : OK
>
>
> 5. For comparison, write only the minimal FRU:
>
> root@akita:~# ipmitool fru write 0 demo.bin
> Fru Size         : 512 bytes
> Size to Write    : 24 bytes
>
> Wait ~10 seconds.
>
> root@akita:~# ipmitool fru print 0
>  Chassis Type          : Rack Mount Chassis
>  Chassis Part Number   : 4711
>  Chassis Serial        : 12345
>  Chassis Area Checksum : OK
>
>
> I dug into this and found that this is caused by an interaction
> between
> https://github.com/openbmc/phosphor-host-ipmid/blob/master/dbus-sdr/stora=
gecommands.cpp
> and
> https://github.com/openbmc/entity-manager/blob/master/src/fru_device.cpp.
>
> Here's what happens:
> - The "ipmitool fru write" request is handled by storagecommands.cpp
> ipmiStorageWriteFruData.
>
> - ipmiStorageWriteFruData receives the whole FRU blob from IPMI across
> several calls. On the initial call, it requests the current FRU blob
> via D-bus from fru-device and caches it in the process. It then
> overwrites sections of that cache with the received data from IPMI.
>
> - ipmiStorageWriteFruData uses information from the FRU header to
> check whether it received all the bytes that make up the new FRU. Note
> that this could be fewer bytes than the size of the cached blob. Once
> it receives all the bytes for the new FRU, it calls
> /xyz/openbmc_project/FruDevice WriteFru via D-Bus with the full FRU
> blob (i.e. the full cache with modifications on top). After that the
> cache is cleared.
>
> - The D-Bus call to WriteFru is handled by fru_device.cpp writeFRU. It
> first performs a sanity check and then writes the blob to the
> underlying device (or the /etc/fru/baseboard.fru.bin for FRU 0). It
> subsequently calls rescanBusses() which actually executes after about
> 1 second.
>
> - Meanwhile, "ipmitool fru write" continues to happily send additional
> bytes to ipmiStorageWriteFruData (as in step #3 above). Since its
> cache has just been cleared, it retrieves the current FRU from
> fru-device again. However, since that has not yet completed
> "rescanBusses", it actually received the original FRU again, not the
> modified version. The above cycle repeats, but this time the original
> FRU with additional modifications from the additional bytes.
>
> In the best case (if the new FRU data is larger than the original FRU
> data), the result is that the FRU did not get updated at all, since we
> effectively just wrote back the original FRU. However, if the new FRU
> data is smaller than the original FRU data, this may result in
> corrupted FRU data to be persisted.
>
>
> I was trying to figure out how to best fix that, but couldn't come up
> with a design that would still work. Some ideas:
>
> A)  I think what we're missing is feedback from fru-device to ipmid
> that the FRU write operation has actually completed and the FRU data
> was re-read. The ipmid should probably not accept any additional write
> requests until the previous write request has completed and the new
> FRU data is available.
>
> B) If ipmiStorageWriteFruData cannot detect the expected size of the
> FRU data, it relies on a timeout to eventually write the blob if no
> more data was received from IPMI. I wonder if this mechanism is "too
> clever" and we should simply always just wait for the timeout?
>
> C) ipmiStorageWriteFruData clears the cache immediately after WriteFru
> was called. Maybe we should keep that cache around until the timeout
> expires?
>
> Thoughts?
>
> Thanks
> Oskar.
>

--000000000000401fcb06178e83a3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi=C2=A0Oskar,<div><br></div><div>&gt; C) ipmiStorageWrite=
FruData clears the cache immediately after WriteFru was called. Maybe we sh=
ould keep that cache around until the timeout expires?</div><div><br></div>=
<div><div>It seems like this is an issue of multiple clients taking to ipmi=
d. In the middle of writing... There is another client that is reading or s=
omething</div><div>else and will reset the fruCache as you mentioned. In th=
at case, I think it may be best to refactor it out to use another getFru me=
thod... maybe like getFruToWrite</div><div><br></div><div>Maybe just someth=
ing like this</div><div><br></div><div>```</div><div>std::vector&lt;uint8_t=
&gt; getFruToWrite(...){</div><div>=C2=A0 if (writeTimer-&gt;isRunning()) {=
</div><div>=C2=A0 =C2=A0 return fruCacheForWrite;</div><div>=C2=A0 }</div><=
div>=C2=A0=C2=A0auto [_, fruCacheForWrite] =3D getFru(...);</div><div>=C2=
=A0 return fruCacheForWrite;</div><div>}</div><div>```</div><div><br></div>=
<div>Also need to change `writeFruCache` and such to use `fruCacheForWrite`=
 and such.</div></div><div><br></div><div>Please let=C2=A0me know if that w=
orks for you. Feel free to reach out internally for faster feedback.</div><=
div><br></div><div>Willy Tu</div></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Thu, May 2, 2024 at 11:32=E2=80=AFAM Os=
kar Senft &lt;<a href=3D"mailto:osk@google.com">osk@google.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi everyone<b=
r>
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

--000000000000401fcb06178e83a3--
